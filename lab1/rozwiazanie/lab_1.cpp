#include <fstream>
#include <iostream>
#include <gsl/gsl_histogram.h>
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>

using namespace std;

int main(int argc, char **argv) {

	ofstream outeps("data.dat");
	ofstream dist("dist.dat");

	FILE * hist = fopen("hist.dat", "w");
	FILE * param = fopen("param.txt", "w");

	double a = -5;
	double b = 5;		// range
	
	// random generator
	gsl_rng *r;
	gsl_rng_env_setup();
	r = gsl_rng_alloc(gsl_rng_ranlxs2);
	gsl_rng_set(r, 2875910);

	int n = atoi(argv[1]);			// number of random num
	double s = atof(argv[2]);		// cauchy parameter
	int bins = atoi(argv[3]);		// number of bins



	// histogram - define

	gsl_histogram *h = gsl_histogram_alloc(bins);
	gsl_histogram_set_ranges_uniform(h, a, b);

	for (int i=0; i<n; i++) {
		double xrnd;
		xrnd=gsl_ran_cauchy(r, s);
		gsl_histogram_increment(h, xrnd);	// add to histogram
		outeps<<i+1<<" "<<xrnd<<endl;
	}
	
	//gsl_histogram_fprintf(stdout, h, "%g", "%g");
	//printf("Po normalizacji:\n");
	gsl_histogram_scale(h, bins/(n*(b-a)));
	gsl_histogram_fprintf(hist, h, "%g", "%g");

	for (int i=0; i<=10*bins; i++) {
		double p = gsl_ran_cauchy_pdf(a+i*(b-a)/(10*bins), s);
		dist<<a+i*(b-a)/(10*bins)<<" "<<p<<endl;
	}

	// ranges
	double lower = 0.0;
	double upper = 0.0;
	double delta = 0.0;
	double dx = (b-a)/(1000*bins);

	for (int i=0; i<bins; i++) {
		gsl_histogram_get_range(h, i, &lower, &upper);
		for (int j=0; j<1000; j++) {
			double diff = gsl_ran_cauchy_pdf((lower+j*(upper-lower)/1000), s) - gsl_histogram_get(h, i);
			delta += diff*diff*dx;
		}
	}
	
	fprintf(param, "Range: [%.1f %.1f]\nRandom numbers: %d\nBins: %d\nDist param. s: %.1f\n", a, b, n, bins, s);
	fprintf(param, "Error: %.2E\n", delta);	
	
	fclose(hist);
	fclose(param);
	gsl_histogram_free(h);
	gsl_rng_free(r);
}
