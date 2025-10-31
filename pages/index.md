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

{% include figure.html width="50%" img="coeffs.png" alt="Forest Plot of Basic Logistic Regression Model Predicting Switching or Augmenting" caption="Figure 3: Odds ratios and 95% confidence intervals for factors predicting medication switch or augmentation relative to baseline rates for Male patients prescribed an SSRI. Stress, companionship, and medication class influence baseline modification rates. Preliminary data (same as Figure 1, N=123,010)." %}

Models like these provide general information useful for all patients, but personalized, patient-specific predictions are also possible with modern machine learning approaches. In these settings, “explainable” machine learning provides individual-level information that can help guide decision making, and previous literature has applied these and similar methods to medication decision making \cite{Abbas2025-uf}. We are experienced in these and related methods via work in mental health and other disease contexts \cite{Hurwitz2025-sh,Hurwitz2025-vu,Pfaff2023-ap,McInnis2025-qx,Coleman2024-id}.

{% include figure.html width="90%" img="force_plot.png" alt="Example Force Plot Providing Individual-Level Explanations" caption="Figure 4: Example “force plot” illustrating how Shapley Additive Explanations (SHAP) provide per-patient information influencing predictions. Such ‘explainable predictions’ can inform decision making, but their interpretability is limited for non-specialists. Large Language Models can close this interpretability gap, serving to summarize and contextualize model results for clinical application. Mock data shown for illustrative purposes." %}

#### Why has no one done this yet? Where does AI fit in?

Clinical decision support systems (CDSS) designed to facilitate decision making are not a new idea, including those that integrate predictions based on patient data, but few have seen widespread use. Several studies have identified a number of factors influencing their acceptability in practice, including systems’ respect for clinician autonomy, features such as data visualization, customization and scenario exploration, and usability factors such as when and how information is presented \cite{Bayor2025-je,Bologva2016-iw,Wang2023-bw}. 

A significant barrier to adoption is the amount and complexity of information provided, especially when predictive models are integrated. While clinicians report increased trust in systems that transparently report methods and evaluations \cite{Jacobs2021-py}, most are not trained in advanced machine learning or biostatistical techniques. CDSS that integrate explainability methods such as SHAP and LIME provide even more detailed information, but technical explainability should not be confused with clinical interpretability, especially in clinical settings when employed by non-experts \cite{Petch2022-dk}.

Generative AI provides new opportunities to develop better user interfaces, integrating explainable predictive models as ‘tools’ that agentic AI can call and interpret, Retrieval Augmented Generation (RAG) for incorporation of other data and care guidelines, and novel assistive functions via turn-based and other engagement types \cite{Luera2024-ui}. LLMs can also effectively interpret and contextualize complex predictive model outputs \cite{Bordt2024-oj}, serving as a ‘data scientist in the room’ engaging with clinicians, patients, data, and documentation together.

In usability studies, providers report a desire for customization, ‘what if’ scenario explorations, just-in-time information, and rapid interactions \cite{Bayor2025-je,Bologva2016-iw,Wang2023-bw}. Related features supported by generative AI interfaces include:

* Custom instructions, for example to instruct avoiding medications not available at a particular clinic.
* Data and predictive results interpretation, contextualized with other available data and established care guidelines.
* On-demand information via text-based interfaces and UI components triggered by LLM responses.
* Suggested contextual follow-up questions based on patient context and data
* Automatic logging for auditability and accountability.


{% include figure.html width="120%" img="genai_ui_ex.png" alt="Mock Interface Integrating Explainable Predictive Models with Patient Data Interpreted by Generative AI" caption="Figure 5: Mock clinical decisions support interface demonstrating potential integrations of explainable predictive models and LLM-supported features. Early discussions with providers and patients highlight the importance of customizability, ease and speed of use, and just-in-time information suggestions. Mock data and results shown." %}




## References

{% bibliography --cited %}