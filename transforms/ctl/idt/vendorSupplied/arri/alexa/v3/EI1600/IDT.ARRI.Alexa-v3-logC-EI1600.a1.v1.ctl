
// <ACEStransformID>IDT.ARRI.Alexa-v3-logC-EI1600.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRI V3 LogC (EI1600)</ACESuserName>

// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 1600
// Written by v3_IDT_maker.py v0.08 on Friday 19 December 2014

float
normalizedLogCToRelativeExposure(float x) {
	if (x > 0.160193)
		return (pow(10,(x - 0.387093) / 0.237781) - 0.038625) / 5.555556;
	else
		return (x - 0.092824) / 5.163345;
}

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	float r_lin = normalizedLogCToRelativeExposure(rIn);
	float g_lin = normalizedLogCToRelativeExposure(gIn);
	float b_lin = normalizedLogCToRelativeExposure(bIn);

	rOut = r_lin * 0.680206 + g_lin * 0.236137 + b_lin * 0.083658;
	gOut = r_lin * 0.085415 + g_lin * 1.017471 + b_lin * -0.102886;
	bOut = r_lin * 0.002057 + g_lin * -0.062563 + b_lin * 1.060506;
	aOut = 1.0;

}
