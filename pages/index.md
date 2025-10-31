---
title: "Extract, Predict, Support: Improving Medication Choice and Outcomes from Clinical Data to Decision Support"
layout: page-narrow
nav: Main
---



<br />

#### What is this project about?

Medication therapy, along with psychotherapy, is effective and widely utilized for the treatment of anxiety and depression disorders. Unfortunately, no single medication is universally effective, and many patients suffer from a harmful trial-and-error process to find the right medication.

Our project aims to develop explainable machine learning models for medication choice from large-scale Electronic Health Record (EHR) data, and integrate those models into useful and usable interfaces, with interpretation of the results contextualized by generative AI for clinical audiences.

By combining the strengths of traditional machine learning approaches with the unique interaction and information processing capabilities of large language models (LLMs), we believe we can help clinicians and patients find the right treatment faster, with far less suffering and cost.

<br />

#### How large of a problem is medication choice for anxiety and depression?

This issue and its impacts are massive. Depression and anxiety disorders are the most common mental disorders worldwide, affecting an estimated 279 and 458 million individuals respectively as of 2019 {% cite Wang2025-tq,Zhang2025-yf %}. These diseases take a significant toll, impacting physical health, financial wellbeing, and life expectancy {% cite Wang2025-tq,Walker2015-kk %}.

Along with psychotherapy, medication therapy is considered an effective first-line treatment, with over 8.8 million in the UK alone prescribed an antidepressant {% cite NHS-Business-Services-Authority2025-mv %}. Unfortunately, no single medication, or even class of medications, is universally appropriate {% cite Trivedi2006-gx %}. Initial prescriptions are frequently ineffective, with upwards of 55% of major depressive disorder (MDD) patients not responding, and estimates for medication switches up to 40% {% cite Mars2017-kd %}. 

Our own preliminary analysis bears this out: across a cohort of patients in the AllOfUs dataset {% cite UnknownUnknown-oy %} with an initial diagnosis of anxiety or depression and subsequent medication, 48% switched or supplemented with additional medications at a later date, and 24% did so more than once. The diversity of initial and subsequent prescriptions and classes illustrates just how little information is available to guide treatment choices:

{% include figure.html img="sankey.png" alt="Sankey Diagram of Medication Pathways" caption="Figure 1: Prescription patterns after an initial anxiety and/or depression diagnosis in the AllOfUs cohort. Of 123,010 patients prescribed medication, 48% percent modified (switched or augmented) at a later date, 24% did so more than once. Preliminary data; top 10 medications and up to 2 modifications shown for clarity." %}






## References

{% bibliography --cited %}