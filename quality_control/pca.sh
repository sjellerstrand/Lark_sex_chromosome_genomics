### Do a PCA
## Prune variants
plink --vcf $VCF_OUT.vcf.gz --double-id --allow-extra-chr --set-missing-var-ids @:# \
--vcf-half-call missing --indep-pairwise 50 10 0.1 --out $VCF_OUT;
## Calculate Pricipal components
plink --vcf $VCF_OUT.vcf.gz --double-id --allow-extra-chr --set-missing-var-ids @:# \
--vcf-half-call missing --extract $VCF_OUT.prune.in --pca 20 --out $VCF_OUT;

### Plot Pricipal component 1 and 2
Rscript $MAINDIR/scripts/$PROJECT/quality_control/pca.r \
--args VCF_OUT=$VCF_OUT DATA=$DATA METADATA=$METADATA;
