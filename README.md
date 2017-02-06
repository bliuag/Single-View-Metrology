# proj3

The basic idea comes from the report `SingleViewMetrologyFinalReport.pdf`.

Here attached the abstract of this report to show the basic idea.

## Abstract

We describe how 3D affine measurements may be computed from a single perspective view of a scene given only minimal geometric information determined from the image. This minimal information is typically the vanishing line of a reference plane, and a vanishing point for a direction not parallel to plane. It is shown that affine scene structure may then be determined from the image, without knowledge of the camera’s internal calibration (e.g. focal length), nor of the explicit relation between camera and world (pose).

In particular, we show how to compute 
(i) the three sets of vanishing points in X, Y, Z directions; 
(ii) the vanishing lines of the image; 
(iii) distance between planes that parallel to the reference plane (up to a common scale factor); 
(iv) image wrapping. Simple geometric derivations are given for these results. We also develop an algebraic representation which unifies the four types of measurement.

We demonstrate the technique for a variety of applications, including height measurements in forensic images and 3D graphical modeling from single images. 

Keywords: 3D reconstruction, photogrammetry, image warping.