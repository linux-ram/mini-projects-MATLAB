%script to read in some grades, display the overall grade.
load classGrades

%classGrades file contains a single variable
%called namesAndGrades. The first column contains the students ‘names’, they’re
%just the integers from 1 to 15. The remaining 7 columns contain each student’s
%score (on a scale from 0 to 5) on each of 7 assignments. There are also 
%some NaNs which indicate that a particular student was absent on that day 
%and didn’t do the assignment.
grades=namesAndGrades(:,2:end);%extract the submatrix

%nanmean computes the mean using only the numbers that are not NaN.
meanGrades=nanmean(grades);


%Normalize each assignment so that the mean grade is 3.5 (this is a B-on our 5 point
%scale). and divide each column of grades by the correct element of meanGrades
meanMatrix=ones(size(grades,1),1)*meanGrades; 
curvedGrades=3.5*(grades./meanMatrix);

%find all the elements in curvedGrades that are greater than 5 and set them to 5
curvedGrades(find(curvedGrades>5))=5;

%numerical grade for each student
%use ceil to end up with numbers from 1 to 5
totalGrade=ceil(nanmean(curvedGrades,2));
letters='FDCBA';

%use totalGrade to index into letters
letterGrades=letters(totalGrade);
disp(letterGrades)