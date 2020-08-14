BankNoteData;
FirstFeature=BankNoteData(:,1);
SecondFeature=BankNoteData(:,2);
ThirdFeature=BankNoteData(:,3);
FourthFeature=BankNoteData(:,4);
Diff1=FirstFeature-(mean(FirstFeature));
Diff2=SecondFeature-(mean(SecondFeature));
Diff3=ThirdFeature-(mean(ThirdFeature));
Diff4=FourthFeature-(mean(FourthFeature));
Variance1=sqrt((sum(Diff1.^2))/1372);
Variance2=sqrt((sum(Diff2.^2))/1372);
Variance3=sqrt((sum(Diff3.^2))/1372);
Variance4=sqrt((sum(Diff4.^2))/1372);
Norm1=Diff1/Variance1;
Norm2=Diff2/Variance2;
Norm3=Diff3/Variance3;
Norm4=Diff4/Variance4;
Normalization = [Norm1 Norm2 Norm3 Norm4 Class]; %to combine into one DataSet
Newmatrix = Normalization(:,1)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,2)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,3)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,4)>3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,1)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,2)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,3)<-3;
Normalization(Newmatrix,:) = [];
Newmatrix = Normalization(:,4)<-3;
Normalization(Newmatrix,:) = [];
y=size(Normalization);
one=Normalization(:,1);
two=Normalization(:,2);
three=Normalization(:,3);
four=Normalization(:,4);
Classes = Normalization(:,5);

FinalMatrix=[one two three four]
%to print the covariance of the matrix of the final matrix
Covar=cov(FinalMatrix)
%to print the eigen values
[EigenVectors,EigenValues]=eig(Covar)

%to print the largest two values of the eigen values
III=EigenVectors(:,3)
IV=EigenVectors(:,4)
%to print the new set of Features
NewFeature1=FinalMatrix*III
NewFeature2=FinalMatrix*IV
%plotting graph
scatter(NewFeature1,NewFeature2, 50, 'b', '*')

a=sum(EigenValues(:,1))
b=sum(EigenValues(:,2))
c=sum(EigenValues(:,3))
d=sum(EigenValues(:,4))

SquaredError=a+b
 
PercentError=((a+b)/(a+b+c+d))*100








