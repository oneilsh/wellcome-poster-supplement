---
title: "Extract, Predict, Support: Improving Medication Choice and Outcomes from Clinical Data to Decision Support"
layout: page-narrow
nav: Main
---

<br />
{:.no_toc}

* TOC
{:toc}

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

Patients often switch or modify medications due to adverse side effects; as illustrated by Campos et al. \cite{Campos2021-yh}, these range from mild symptoms such as dry mouth and runny nose to severe, including suicidal ideation:

{% include figure.html width="60%" img="side-effects.png" alt="Common Side Effects of Anxiety and Depression Medications" caption="Figure 2: Common side effects for medications often prescribed for anxiety or depression, courtesy Campos et al. 2021 (Campos et al., 2021), highlighting the diversity of adverse reactions across medications ranging from minor (runny nose, dry mouth) to severe (suicidal thoughts and attempts)." %}

**Simply put, helping patients and clinicians identify effective medications with less trial-and-error would eliminate a tremendous amount of human suffering.**

#### Can you really predict which medications will work best?

Yes! Genetics, age, sex, and other patient-specific features are increasingly recognized influences \cite{Murphy2003-zi,Thase2005-sf}, suggesting a role for personalized therapeutic choices. Indeed, recent applications have shown promise in predicting medication outcomes in psychiatry, and for depression specifically \cite{Chekroud2021-ft,Elbakary2025-zu,Sheu2023-js}.

Our own preliminary analyses support this hypothesis as well: using the same data as above, we modeled the probability of switching or augmenting based on patient demographic and risk factors, revealing that levels of stress, companionship, and choice of medication class influences likelihood of a change in medication regime:

{% include figure.html width="40%" img="coeffs.png" alt="Forest Plot of Basic Logistic Regression Model Predicting Switching or Augmenting" caption="Figure 3: Odds ratios and 95% confidence intervals for factors predicting medication switch or augmentation relative to baseline rates for Male patients prescribed an SSRI. Stress, companionship, and medication class influence baseline modification rates. Preliminary data (same as Figure 1, N=123,010)." %}

## References

{% bibliography --cited %}