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

This issue and its impacts are massive. Depression and anxiety disorders are the most common mental disorders worldwide, affecting an estimated 279 and 458 million individuals respectively as of 2019 \cite{Wang2025-tq,Zhang2025-yf}. These diseases take a significant toll, impacting physical health, financial wellbeing, and life expectancy \cite{Wang2025-tq,Walker2015-kk}. 

Along with psychotherapy, medication therapy is considered an effective first-line treatment, with over 8.8 million in the UK alone prescribed an antidepressant \cite{NHS-Business-Services-Authority2025-mv}. Unfortunately, no single medication, or even class of medications, is universally appropriate \cite{Trivedi2006-gx}. Initial prescriptions are frequently ineffective, with upwards of 55% of major depressive disorder (MDD) patients not responding, and estimates for medication switches up to 40% \cite{Mars2017-kd}. 

Our own preliminary analysis bears this out: across a cohort of patients in the AllOfUs dataset \cite{UnknownUnknown-oy} with an initial diagnosis of anxiety or depression and subsequent medication, 48% switched or supplemented with additional medications at a later date, and 24% did so more than once. The diversity of initial and subsequent prescriptions and classes illustrates just how little information is available to guide treatment choices:


{% include figure.html img="sankey.png" alt="Sankey Diagram of Medication Pathways" caption="Figure 1: Prescription patterns after an initial anxiety and/or depression diagnosis in the AllOfUs cohort. Of 123,010 patients prescribed medication, 48% percent modified (switched or augmented) at a later date, 24% did so more than once. Preliminary data; top 10 medications and up to 2 modifications shown for clarity." %}

Patients often switch or modify medications due to adverse side effects; as illustrated by Campos et al. \cite{Campos2021-yh}, these range from mild symptoms such as dry mouth and runny nose to severe, including suicidal ideation:

{% include figure.html width="60%" img="side-effects.png" alt="Common Side Effects of Anxiety and Depression Medications" caption="Figure 2: Common side effects for medications often prescribed for anxiety or depression, courtesy Campos et al. 2021 (Campos et al., 2021), highlighting the diversity of adverse reactions across medications ranging from minor (runny nose, dry mouth) to severe (suicidal thoughts and attempts)." %}

**Simply put, helping patients and clinicians identify effective medications with less trial-and-error would eliminate a tremendous amount of human suffering.**


<br />

#### Can you really predict which medications will work best?

Yes! Genetics, age, sex, and other patient-specific features are increasingly recognized influences \cite{Murphy2003-zi,Thase2005-sf}, suggesting a role for personalized therapeutic choices. Indeed, recent applications have shown promise in predicting medication outcomes in psychiatry, and for depression specifically \cite{Chekroud2021-ft,Elbakary2025-zu,Sheu2023-js}.

Our own preliminary analyses support this hypothesis as well: using the same data as above, we modeled the probability of switching or augmenting based on patient demographic and risk factors, revealing that levels of stress, companionship, and choice of medication class influences likelihood of a change in medication regime:

{% include figure.html width="50%" img="coeffs.png" alt="Forest Plot of Basic Logistic Regression Model Predicting Switching or Augmenting" caption="Figure 3: Odds ratios and 95% confidence intervals for factors predicting medication switch or augmentation relative to baseline rates for Male patients prescribed an SSRI. Stress, companionship, and medication class influence baseline modification rates. Preliminary data (same as Figure 1, N=123,010)." %}

Models like these provide general information useful for all patients, but personalized, patient-specific predictions are also possible with modern machine learning approaches. In these settings, “explainable” machine learning provides individual-level information that can help guide decision making, and previous literature has applied these and similar methods to medication decision making \cite{Abbas2025-uf}. We are experienced in these and related methods via work in mental health and other disease contexts \cite{Hurwitz2025-sh,Hurwitz2025-vu,Pfaff2023-ap,McInnis2025-qx,Coleman2024-id}. 

{% include figure.html width="90%" img="force_plot.png" alt="Example Force Plot Providing Individual-Level Explanations" caption="Figure 4: Example “force plot” illustrating how Shapley Additive Explanations (SHAP) provide per-patient information influencing predictions. Such ‘explainable predictions’ can inform decision making, but their interpretability is limited for non-specialists. Large Language Models can close this interpretability gap, serving to summarize and contextualize model results for clinical application. Mock data shown for illustrative purposes." %}

<br />

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


{% include figure.html width="100%" img="genai_ui_ex.png" alt="Mock Interface Integrating Explainable Predictive Models with Patient Data Interpreted by Generative AI" caption="Figure 5: Mock clinical decisions support interface demonstrating potential integrations of explainable predictive models and LLM-supported features. Early discussions with providers and patients highlight the importance of customizability, ease and speed of use, and just-in-time information suggestions. Mock data and results shown." %}

<br />


#### What about clinical note data?

Clinical data come in several forms, one of which is **structured** data, typically represented by demographic information (e.g. age, sex) and medical ‘codes’ for features like conditions (e.g. ICD10 F31.1, Major Depressive Disorder), prescriptions (e.g. RxNorm 283672, Citalopram 10mg Oral Tablet), or procedures (e.g. CPT 90837, Individual Psychotherapy, 60 minutes). 

Another is **clinical notes**, free-text entered by clinicians or assistants during the course of care; SOAP notes for example capture Subjective and Objective patient features, an overall Assessment, and care Plan in paragraph form.

Coded, structured data has several advantages for understanding and predicting patient experience:

* It allows for precise and sophisticated querying, for example to search “all patients with any type of anxiety diagnosis comorbid with any type of depression diagnosis within 2 weeks, followed by administration of escitalopram for at least 6 weeks.”
* Its tabular format supports a wide variety of modeling techniques, including biostatistical (cohort matching, survival analyses) machine learning (e.g. XGBoost, Random Forests, Support Vector Machines), and post-hoc explainability methods (e.g. Shapley Additive exPlanations, SHAP, Local Interpretable Model-agnostic Explanations, LIME).
* It is efficient, in the sense of representing a large amount of information in a small amount of text, an important factor when utilizing language models with limited context windows for summarization or other tasks. 
* It is fully de-identified, unlike notes which are difficult to guarantee free of personally identifiable information thus risking patient privacy. 

However, **structured data typically available for research use misses detailed information available in notes**. This is not because this information is not codable; the SNOMED medical vocabulary for example contains codes for millions of concepts, including social and related risk factors (e.g. 301887005, Needs Assistance at Home), common and rare adverse drug reactions (240091000000105, Blurred Vision), and much more. Rather, medical coding is a time consuming manual process, and typically only information useful for billing is captured in the US. The UK fares somewhat better in general practice, but less so in specialty clinics \cite{Tayefi2021-vi,Wilson2018-xr}. As a result, readily-available structured data is not as complete as it could be. 

We’ll use LLMs to enhance structured data by processing, de-identifying, and coding concepts from free-text clinical notes, focusing on risk factors, treatments, and outcomes for anxiety and depression. This will require careful and ethical selection of a set of patient notes, and manual coding for evaluation purposes by trained human scribes.

We have developed a pilot note-coding pipeline on mock data using an agent-based approach inspired by the manual coding process. Here, an LLM agent is provided with tools to 1) identify spans of text representing codable concepts, including negations (for e.g. ‘patient denies’ annotations), 2) search for medical concepts using a Retrieval Augmented Generation (RAG) approach guided by embeddings appropriate for short clinical text \cite{Excoffier2024-cd}, and 3) suggest alternative phrasings and consider more- and less-specific codes by navigating the medical hierarchy. Our initial implementation generates a full report for auditability and can be run in graphical or “batch” mode for large-scale processing in a secure compute environment. 

{% include figure.html width="100%" img="extract_gui.png" alt="Medical Concept Coding Extraction GUI" caption="Figure 6: Pilot pipeline translating free-text clinical notes to structured medical concept codes, available as a graphical user interface (shown) or batch-processor for use in secure environments. The resulting additional ‘structured’ data enriches quantifiable measurements of experiences and outcomes, contributes to model performance, and enhances patient privacy in research. This agent-based pipeline employs a multi-step approach based on human annotation processes." %}


Ultimately, performing this process on notes for a diverse cohort of patients with anxiety and depression will provide several benefits:

* We will better quantify the experiences of patients with more detailed data suitable for large-scale exploratory data analyses or unsupervised clustering techniques (see below). 
* We will enhance patient privacy in research by publishing our extraction and de-identification methods for use in other contexts.
* We will enhance the accuracy of predictive models for medication choice with improved data depth and breadth. 

<br />

#### How are you incorporating lived experiences of those with Anxiety and Depression?

Our project idea was driven by a shared realization that several of our team members have lived experience with medications for anxiety and/or depression, with a consistent theme of diverse side effects impacting our personal and professional lives, lack of or loss of effectiveness over time, trials, and cross-tapers, despite eventual relief. We informally confirmed this as a common experience with others and clinical colleagues in psychiatry, but to ensure independent viewpoint integration, we will include those with lived experience as a primary role throughout the project. Via outreach to our local chapter of the National Alliance for Mental Health (NAMI) we have invited Said Alhassan, board of directors member and patient advocate with lived experience, as a full team member. His input has been instrumental in discussions of access to psychiatric medications, frustrations in identifying effective therapies, and development of community engagement sessions for broader input, in addition to contributing to technical discussions and strategic vision.

Our team additionally includes a practicing psychiatrist, Dr. Danielle Lowe, with extensive experiential knowledge in prescribing and patient care. In collaboration with other team members, we will convene a **Community Advisory Board (CAB)** consisting of clinicians with inpatient, outpatient, psychiatric and general practitioner experience, and patients with lived experience including both treatment-responsive and treatment-resistant anxiety and depression. For the latter, we will recruit through advocacy organizations including the NAMI national organization, the Anxiety and Depression Association of America, and the LiveWell Foundation, striving to recruit CAB members who are engaged with patient advocacy in their respective organizations to promote broad perspectives.

Using accelerator funds we have engaged with the UNC Patient and Community Engagement (PaCER) center to facilitate community engagement sessions, laying the groundwork for the CAB and early research priorities via journey-mapping exercises with both patients and prescribers. 

{% include figure.html width="100%" img="journey_mapping.png" alt="Journey-Mapping Exercises with Clinicians and Patients" caption="Figure 7: In the course of care, clinicians and patients engage in shared decision making based on symptom presentation, patient characteristics, and clinician experience. While some of this information is objective (e.g. co-occurring conditions, medication interactions), other information is subjective (e.g. clinician and patient preferences). Journey mapping exercises with both groups provide insight on the collaborative process at key decision points and will guide model and tool development." %}

Finally, members of the CAB will be invited to review preliminary results, suggest revisions, and be invited as co-authors to publications in relevant medical informatics journals, a strategy we have successfully employed with Long COVID lived experience experts and patient advocacy groups \cite{O-Neil2024-gq,McCorkell2021-am}. 


<br />

#### Can you find and use novel patterns in data about anxiety and depression?

Yes, large-scale EHR data provides detailed information across millions of patients, enabling a broad range of data mining techniques that can reveal previously known trends or patterns. Applicable methods are many, including clustering, timeseries analyses, dimensionality reduction, visualization, latent variable techniques, and more \cite{Yadav2018-xc}.

Some techniques provide a degree of interpretability; for example principle components or latent class analyses for population-level trends \cite{Hegeman2024-kr}, or probabilistic methods such as LDA which report comorbidity distributions \cite{Mustakim2021-ae}. Semi-supervised or combined methods can utilize cluster-like information for predictions, or relate patterns to other known patient information. For example, we developed a novel method to associate LDA-based comorbidity clusters with patient outcomes (e.g. to identify novel presentations of Long COVID) or demographic factors such as age and sex:

{% include figure.html width="45%" img="cluster.png" alt="Clustering Patient Features" caption="Figure 8: Top: one cluster (of 300) identified in an analysis of 9M+ patient condition comorbidities reveals associations between anxiety and depression disorders, insomnia, and other patient factors. Conditions are sized by relative prevalence, and colored by relative strength of cluster association. Below: female patients and adults are more strongly associated with this cluster than males, children, or seniors. Similar techniques may be applied to other patient factors such as medication status or outcome. Based on O’Neil et al. 2024." %}

<br />

#### What databases or other resources will you use?

We have extensive experience collecting and using patient health data, including founding the US-based National Clinical Cohort Collaborative (N3C, 29M+ patients), developing the Center for Linkage and Data for the AllOfUs research program (500K+ patients), and working with commercial data providers such as Truveta (120M+ patients). Moreover, our organization (UNC) hosts the Carolina Data Warehouse for Health (CDWH), with access to de-identified EHR data for over 7 million North Carolina residents, a population that is diverse racially and socioeconomically (which is also an explicit goal of AllOfUs). These de-identified datasets include conditions, drug prescriptions, observations, lab measurements, procedures, and several other domains.

With sufficient patient privacy protections and ethical review, we can additionally access clinical notes for defined subpopulations of CDWH, which additionally provides access to GPUs and LLM hosting, including open source (e.g. Llama) and commercial (ChatGPT, Claude) models via private-cloud business agreements.

In secure and public contexts, we have access to cloud resources for hosting (GCP, Azure), experience in data and database management (Postgres, Neo4j, MongoDB, SOLR), analysis and distributed compute environments (Apache Spark, Python/R), backend, API, and frontend development (Python, Java, JavaScript, various frameworks), and local and hosted LLM-based application development (Pydantic.AI, FAISS, transformers).

<br />

#### How will you protect patient privacy?

Patient privacy is paramount, and several components of our project require careful consideration of how patient information and data are used.

First is the composition of our Community Advisory Board (CAB), which will consist of both clinicians and patients with lived experience of anxiety and depression. Patients and providers often make medication decisions collaboratively \cite{Jacobs2021-py}, and including both groups in conversations about the project will best include these shared perspectives. However, we are sensitive to potential stigmatization, power, and authority imbalances between these groups. We will thus engage with patients and clinicians separately and individually as well, building a culture of trust, safety, and when appropriate, anonymity. Operating procedures for the CAB will be designed by early discussions with the CAB itself and the project Steering Committee.

The technical aspects of our project also potentially impact patient privacy. Although the majority of our analyses will make use of de-identified data, these are nevertheless sensitive, require access approval and review, and must not leave the confines of their host computational environments (see Data and Resources above) unless sufficiently aggregated. In fact, this challenge has been a barrier to the broad deployment of predictive models for clinical decision support systems; highly parameterized models like deep neural networks can and do memorize training data, representing a privacy risk in the model itself \cite{Staab2024-xm}. Fortunately, modifications to well-known methods such as XGBoost and SHAP support strong privacy guarantees for model reuse in broader contexts \cite{Bogdanova2023-ms,Grislain2021-eg}, and we will evaluate these against other privacy-preserving techniques (such as low-parameter regression models).

Finally, part of our project aims to enhance predictive model accuracy while improving patient privacy by extracting, de-identifying, and ‘coding’ clinical vocabulary terms from sensitive free-text notes. This work, including manual annotation of notes for evaluation purposes, will be performed entirely within the network-isolated Carolina Data Warehouse for Health (CDWH) computational environment, only by those approved for access with all appropriate training and review by our project Steering Committee and IRB. We will operate on a limited number of patient notes, but sufficient to provide diversity in the cohorts for anxiety and depression disorders and evaluation metrics.

<br />

#### How will you ensure your work is conducted ethically?

We have significant experience working with both de-identified and identified patient health data, as well as expertise at the intersection of public health policy and ethical outcomes. Based on previous experience, we plan to institute a 2-part governance structure consisting of a project Steering Committee and Community Advisory board:

**Steering Committee**: A multidisciplinary Steering Committee will provide scientific and strategic oversight, meeting quarterly to review progress, data quality, analytical decisions, and dissemination plans. The committee will provide strategic direction and senior leadership, and include co-applicants with expertise in AI/machine learning, psychiatry, health equity, and data standards. The Steering Committee will also monitor data quality and evaluation metrics, missing data patterns, and potential sources of bias as research progresses. Any unexpected findings or those suggesting potential patient harm or significant algorithmic bias will trigger immediate review.

**Community Advisory Board (CAB)**: A dedicated CAB comprising individuals with lived experience of anxiety and depression, patient advocates, and mental health clinicians will guide and advise on all aspects of the project, including technical aspects via educational sessions as desired. The CAB will meet at least quarterly to provide guidance on study design, interpretation of findings, and identification of potential harms or biases in model outputs. The CAB will review plain-language summaries of research progress and provide input on dissemination strategies to ensure findings reach affected communities. CAB members will receive compensation for their time and expertise.

All study activities operate under IRB approval from participating institutions (UNC-Chapel Hill for CDW-H, All of Us Research Program protocols, and Truveta data use agreements). More details for each data source are described in the Ethics section below. 


<br />

#### Who is on your team?

{% include figure.html width="100%" img="team.png" alt="Our Team" caption="Figure 9: Our team includes strong leadership, project management, practicing clinicians, data scientists, patient advocates with lived experience, software and systems engineers, and UI/UX designers." %}


Dr. Shawn O’Neil will lead the project, with 15 years of experience at the intersection of computer science, biomedical informatics, and real-world data analytics. As Principle Investigator and Technical Lead, he will direct overall project execution, chair the steering committee, ensuring alignment across Aims 1–3. He will also contribute to technical innovation, modeling, and AI-integrated software development within secure environments. 

Dr. Melissa Haendel is the Director of the Translational and Integrative Sciences Laboratory, in which Dr. O’Neil is faculty; Dr. Haendel has over two decades of experience in translational research and leadership in national and international programs. She will provide senior oversight, ensuring methodological rigor, interoperability with national and international data standards, and coordination of dissemination and sustainability efforts.

Dr. Eric Hurwitz will lead computational phenotyping and modeling efforts. Dr. Hurwitz has significant experience in real-world EHR data analysis, including complex cohort definitions and personalized ML modeling for mental health applications. He will oversee data preprocessing, model selection, explainability analyses, and model evaluations.

Dr. Rachel Presskreicher will lead ethical oversight activities and CAB integration, bringing 15 years of interdisciplinary experience at the intersection of psychiatric epidemiology, health policy, and social work. She will ensure all work proceeds with the highest ethical standards, and implement mixed-methods evaluations for CDSS usability, trust, and performance, in addition coordinating co-design activities.

Dr. Danielle Lowe is a board certified General and Child and Adolescent Psychiatrist in the department of Psychiatry, medical director of the UNC adult crisis inpatient psychiatry unit, and member of the UNC Suicide Prevention Institute. Specializing in interventions for treatment-resistant mental illness, she will provide crucial clinical perspectives and liaise with clinician CAB members. 

Said Alhassan, Board Member with the Orange County National Alliance for Mental Health (NAMI) chapter, has personal experience with treatment-resistant depression and is an outspoken patient advocate and community asset. He will provide insights from his own lived experience, and serve as liaison with lived experience experts on the CAB. As a Clinical Research Coordinator in Neurology and former medical scribe, he also has experience with clinical workflows and documentation, and will provide oversight to clinical notes annotation and other aspects of EHR data.

Divya Varun, front-end developer, will lead user-interface design and implementation of CDSS interfaces. With over a decade of experience in user experience design, Ms. Varun will collaborate with clinicians and patients to translate requirements into dynamic interfaces using modern frameworks.

Chris Roeder will serve as lead software engineer, architecting CDSS backend integrations. Mr. Roeder is a senior software engineer with two decades of experience in commercial and scientific software development, including NLP applications. He will coordinate technical implementation across platforms, emphasizing modularity, reproducibility, and auditability.

Sruthi Magesh will provide Project Management support. She has coordinated large, multidisciplinary and multi-organizational scientific projects. Ms. Magesh will manage day-to-day operations using Agile principles, maintaining milestones, documentation, and communication channels. She will ensure deliverables remain on schedule, coordinate reporting, and facilitate engagement across teams and the CAB.

This great core team is supported by the diverse Translational and Integrative Sciences Lab with several other analysts, developers, and engineers, and is embedded in the highly collaborative School of Medicine at UNC Chapel Hill in partnership with the Translational and Clinical Sciences Institute and state-wide UNC Health care network.

<br />

#### Where would clinicians utilize your tool? Would patients be able to access it?

We envision our clinical decision support tool as primarily benefitting care providers tasked with the ultimate responsibility for prescription determinations. However, research has shown that such tools often facilitate discussions between clinicians and patients and enhance shared decision making \cite{Jacobs2021-py}, so we will utilize human-centered co-design processes that involve both providers and patients on our Community Advisory Board, facilitated by UI/UX designers and developers on our team. 

Although this project does not aim to deploy any tools for clinical or public use (per funding requirements), several future deployment options are possible, including:

* Integrated into commercial electronic medical record (EMR) software, smoothly integrating into clinical workflows but restricted to provider access and “over the shoulder” patient views. 
* Integrated into patient facing online health portals, integrating patient data for both clinician and patient-direct accessibility.
* Publicly available on the web, providing the broadest accessibility but limited workflow integration and larger potential for accidental misuse by those without requisite clinical expertise.

Ultimately, these strategic directions and tradeoffs will be an important conversation driven by our Community Advisory Board and Steering Committee. Our organization (University of North Carolina at Chapel Hill School of Medicine) is closely aligned with UNC Health, serving 100K+ of patients across hundreds of locations across the state, and members of our team work with health IT on deployments for other projects (rare disease patient identification). We also have ample experience in public interface and AI application deployments \cite{Putman2024-ca,O-NeilUnknown-jm}, and dual licensing is a possibility to support both open science and commercialization for sustainability. 


<br />

#### Can you do this efficiently? How will you evaluate the components?

Our project involves three specific aims, each supporting the final goal of useful and usable clinical decision support tools, integrating explainable machine learning models with generative AI interpretations. However, each can be developed in parallel, with achieved milestones strengthening components of others:


1. Extract: Development of agent-based, generative AI tools for coding clinical data to medical vocabularies has already begun on publicly available datasets, and we will continue to refine the methods this way with standard train/validate/test approaches and established metrics \cite{Davidson2025-rd}, publishing novel results. When ethical review and approval is gained for access to patient clinical notes, we will migrate the pipeline into the CDWH secure environment to process notes for anxiety and depression patients there. We will simultaneously onboard experienced medical coders to manually annotate a subset of notes for evaluation purposes, focusing on factors for anxiety and depression. These extracted data may then be compared to standard coded metadata, quantifying the extent of ‘dark data’ relevant for anxiety and depression and revealing patterns in patient experience via descriptive analytics and unsupervised modeling. Lastly, these additional data will be added to ongoing predictive modeling efforts (aim 2), enhancing their accuracy by incorporating more diverse patient features.
2. Predict: We already have access to large, de-identified, structured EHR datasets which form the basis for predictive modeling and explainability methods, and have begun developing computational phenotypes for patient cohorts and classification (Figures 1 and 3). Models based on these data will be evaluated using standard cross-validation and hold-out testing approaches, counterfactual validity (for explanation methods), and assessed for potential biases. These efforts can be replicated in multiple environments, including AllOfUs (analysis ongoing), CDWH (analysis ongoing), and others. When extracted clinical note data is available in CDWH, we will incorporate them in modeling there and re-evaluate to quantify improvement. Evaluated models will be incorporated in ongoing decision support system development (Aim 3), along with accompanying documentation for transparency.
3. Support: Development of clinical decision support systems requires input from stakeholders, in this case clinicians, patients, and health system representatives (e.g. information technology administrators). We will center this co-design work around a Community Advisory Board (CAB) of patients and clinicians via continued journey-mapping exercises, discussion groups, and feedback and design sessions with our UI/UX designers and developers. Mock interfaces can be rapidly iterated on with the help of AI development tools (e.g. Cursor AI, Claude Code), incorporating care guidelines and mock patient data and models. As predictive models are validated, they will be incorporated. Final model- and AI-integrated tools will be tested on retrospective data with practicing clinicians, comparing point-in-time simulated decisions against true historical decisions and outcomes.

We are well-equipped to manage a project of this scope, with team leadership and project management having coordinated multiple projects involving multiple organizations and dozens of staff \cite{Cornett2024-lo,Haendel2021-ax}.

{% include figure.html width="100%" img="gantt.png" alt="Gantt Chart" caption="Figure 10: Gantt chart illustrating milestones and tasks associated with each of the 3 aims; most activities can be performed in parallel by independent teams with well-defined integration points. Each aim supports the final goal of useful and usable decision support tools for medication choice, and progress in one area can advance independently while others are refined or validated." %}


## References

{% bibliography --cited %}