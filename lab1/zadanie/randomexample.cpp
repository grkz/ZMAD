     #include <fstream>
     #include <iostream>
     #include <gsl/gsl_histogram.h>
     #include <gsl/gsl_rng.h>
     #include <gsl/gsl_randist.h>
  
using namespace std;
   
    
     int main (int argc, char **argv){

       ofstream outeps("randomexample.dat");
   
    // definition of random generator
       gsl_rng *r;
       gsl_rng_env_setup();
       r = gsl_rng_alloc (gsl_rng_ranlxs2);  
       gsl_rng_set (r, 2875910); // setting initial vaule of ISEED
    //


    
       int n;
       n = atoi (argv[1]); 
       // first parameter is the number of ranodm numbers to generate
       
       
       
       for (int i=0;i<n;i++){
	 double xrnd;
	 xrnd=gsl_rng_uniform (r);
	 cout<<i+1<<" "<<xrnd<<endl;
	 outeps<<i+1<<" "<<xrnd<<endl;
       }
       
       gsl_rng_free(r); //  

     }
