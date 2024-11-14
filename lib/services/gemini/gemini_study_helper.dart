import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiGenerateBreakdowns {
  late final GenerativeModel _model;
  late final ChatSession _chat;

  GeminiGenerateBreakdowns() {
    _model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyDABUaI1Hm-OPnT-_8X598pk2y1zEruaHw',
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
      ),
      systemInstruction: Content.system(
          'You are a highly knowledgeable and experienced tutor capable of explaining complex topics in a clear and concise manner. When I provide you with a topic, I want you to:\n\nBreak down the topic: Explain the core concepts, definitions, and underlying principles in a way that is easy to understand.\nProvide examples: Offer illustrative examples or case studies to reinforce the concepts and make them more concrete.\nThe structure of your response should be like this, a JSON string:\n{\n"name": "(name)",\n"description": "(description)",\n  "breakdowns": [(the breakdowns may be the same as this one: with a name, description, or even a breakdown)]}\n\nImportant Notes:\n1. Kindly refrain from using special characters that are used in Maps and Strings such as double quotes (") and single quotes (")\n2. If you have no idea on the given topic, respond with an empty map\n3. If you are going to respond with a sentence due to some reasons (e.g. the topic is vulgar), try your best to respond with a map adhering to the sample structure mentioned here.\n4. If responding with a sentence rather than a map is imminent, respond with this: {"error": "(reason for error)"}.\n5. Stick with the Map structure of the response that was mentioned here. Do not include anything that the jsonDecoder cannot read.'),
    );
    _chat = _model.startChat(history: [
      Content.multi([
        TextPart('introduction to computing\n'),
      ]),
      Content.model([
        TextPart('''
            {
              name:"Introduction to Computing",
              description: "This topic provides a foundational understanding of what computers are, how they work, and their impact on our lives.",
              breakdowns: [
                {
                  name: "What is a Computer?",
                  description: "A computer is a programmable electronic device that accepts data (input), processes it, stores it, and produces output according to a set of instructions. These instructions are known as software, while the physical components are called hardware."
                },
                {
                  name: "Hardware",
                  description: "The physical components of a computer system. This includes:",
                  breakdowns: [
                    {
                      name: "Input Devices",
                      description: "Used to enter data and instructions into the computer (e.g., keyboard, mouse, microphone)."
                    },
                    {
                      name: "Output Devices",
                      description: "Used to display or present processed data (e.g., monitor, printer, speakers)."
                    },
                    {
                      name: "Processing Unit (CPU)",
                      description: "The "brain" of the computer, executing instructions and performing calculations."
                    },
                    {
                      name: "Memory (RAM)",
                      description: "Temporary storage used to hold data and instructions actively being used by the CPU."
                    },
                    {
                      name: "Storage Devices",
                      description: "Used to store data permanently (e.g., hard drive, SSD, USB flash drive)."
                    }
                  ]
                },
                {
                  name: "Software",
                  description: "Sets of instructions (programs) that tell the hardware what to do. There are two main types:",
                  breakdowns: [
                    {
                      name: "System Software",
                      description: "Manages the computer's hardware and provides a platform for application software (e.g., operating systems like Windows or macOS)."
                    },
                    {
                      name: "Application Software",
                      description: "Programs designed for specific tasks or to solve particular problems (e.g., word processors, web browsers, games)."
                    }
                  ]
                },
                {
                  name: "Data Representation",
                  description: "Computers use binary code (0s and 1s) to represent all data, including text, numbers, images, and sound.",
                },
                {
                  name: "Networks and the Internet",
                  description: "Computers can be connected to share resources and communicate. The Internet is a global network of networks, enabling communication and access to vast amounts of information.",
                },
                {
                  name: "Impact of Computing",
                  description: "Computers have revolutionized nearly every aspect of modern life, from communication and entertainment to healthcare, education, and scientific research.",
                }
              ]
            }
          '''),
      ]),
      Content.multi([
        TextPart('sdafubdiubasc\n'),
      ]),
      Content.model([
        TextPart('{}'),
      ]),
      Content.multi([
        TextPart('drugs\n'),
      ]),
      Content.model([
        TextPart('''
          {
            "name": "Drugs: Understanding Their Effects and Risks",
            "description": "This topic provides an overview of drugs, including their classification, effects on the body and mind, potential risks, and the importance of responsible decision-making.",
            "breakdowns": [
              {
                "name": "Drug Classification",
                "description": "Drugs can be classified based on their effects and legal status.",
                "breakdowns": [
                  {
                    "name": "Stimulants",
                    "description": "Increase alertness, heart rate, and blood pressure (e.g., caffeine, nicotine, cocaine, amphetamines)."
                  },
                  {
                    "name": "Depressants",
                    "description": "Slow down brain function and heart rate (e.g., alcohol, benzodiazepines, barbiturates)."
                  },
                  {
                    "name": "Hallucinogens",
                    "description": "Alter perception, thoughts, and feelings (e.g., LSD, psilocybin mushrooms, MDMA)."
                  },
                  {
                    "name": "Opioids/Narcotics",
                    "description": "Relieve pain and induce euphoria (e.g., heroin, morphine, codeine, fentanyl)."
                  },
                  {
                    "name": "Cannabis",
                    "description": "Has a range of effects, including relaxation, altered perception, and euphoria (e.g., marijuana, hashish)."
                  },
                  {
                    "name": "Inhalants",
                    "description": "Chemical vapors that are inhaled to produce mind-altering effects (e.g., glue, paint thinner, aerosols)."
                  }
                ]
              },
              {
                "name": "Effects on the Body and Mind",
                "description": "Drugs interfere with the normal functioning of the brain and body, leading to various short-term and long-term effects.",
                "breakdowns": [
                  {
                    name: "Short-term Effects"
                    description: "Short-term effects can include changes in mood, perception, heart rate, and coordination.",
                  },
                  {
                    name: "Long-term Effects"
                    description: "Long-term effects can include addiction, organ damage, mental health problems, and social consequences."
                  }
                ]
              },
              {
                "name": "Risks and Dangers",
                "description": "Drug use carries significant risks, including:",
                "breakdowns": [
                  {
                    "name": "Addiction",
                    "description": "A chronic, relapsing brain disease characterized by compulsive drug seeking and use despite harmful consequences."
                  },
                  {
                    "name": "Overdose",
                    "description": "Taking a toxic dose of a drug, which can lead to serious health complications or death."
                  },
                  {
                    "name": "Withdrawal Symptoms",
                    "description": "Unpleasant physical and psychological symptoms that occur when a person stops using a drug they are addicted to."
                  },
                  {
                    "name": "Health Problems",
                    "description": "Organ damage, weakened immune system, mental health disorders, and other health issues."
                  },
                  {
                    "name": "Social Consequences",
                    "description": "Relationship problems, job loss, financial difficulties, and legal issues."
                  }
                ]
              }
            ],
          }
        '''),
      ]),
      Content.multi([
        TextPart('dick'),
      ]),
      Content.model([
        TextPart(
            '{\n"error": "This topic is not appropriate for educational discussion"}')
      ]),
    ]);
  }

  Future<Map> generateBreakdowns(String topic) async {
    final response = await _chat.sendMessage(Content.text(topic));
    Map responseMap = jsonDecode(response.text!);
    if (responseMap.isEmpty) {
      throw Exception("An error has occured");
    } else if (responseMap['error'] != null) {
      throw Exception("${responseMap['error']}");
    } else {
      return responseMap;
    }
  }
}

class GeminiGenerateQuestions {
  late final GenerativeModel _model;
  late final ChatSession _chat;

  GeminiGenerateQuestions() {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: 'AIzaSyDABUaI1Hm-OPnT-_8X598pk2y1zEruaHw',
      generationConfig: GenerationConfig(
        temperature: 0.05,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'application/json',
      ),
      systemInstruction: Content.system(
          'Create 10 multiple-choice questions from the given breakdowns in JSON format. Make sure that the generated questions are related to the given inputs, the choices are from A to D, the answer should be a letter, the choices are accurate, and the questions should stick only with the given breakdowns; do not include other resources, just base on the breakdown. Here\'s the structure of the expected input and output for your reference:\nExpected Input:\n{\n  name: "topic name",\n  description: "description of the topic",\n  breakdowns: [a comprehensive list of breakdowns of the topic],\n}\nExpected Output:\n[\n  {\n    question: "(question)?",\n    choices: "A. (Choice 1)\\nB. (Choice 2)\\nC. (Choice 3)\\nD. (Choice 4)",\n    answer: "(Correct Letter)",\n  },\n  {\n    (same format as above),\n  },\n ...\n]\n\n'),
    );
    _chat = _model.startChat(history: [
      Content.multi([
        TextPart(
            '{\n              name:"Introduction to Computing",\n              description: "This topic provides a foundational understanding of what computers are, how they work, and their impact on our lives.",\n              breakdowns: [\n                {\n                  name: "What is a Computer?",\n                  description: "A computer is a programmable electronic device that accepts data (input), processes it, stores it, and produces output according to a set of instructions. These instructions are known as software, while the physical components are called hardware."\n                },\n                {\n                  name: "Hardware",\n                  description: "The physical components of a computer system. This includes:",\n                  breakdowns: [\n                    {\n                      name: "Input Devices",\n                      description: "Used to enter data and instructions into the computer (e.g., keyboard, mouse, microphone)."\n                    },\n                    {\n                      name: "Output Devices",\n                      description: "Used to display or present processed data (e.g., monitor, printer, speakers)."\n                    },\n                    {\n                      name: "Processing Unit (CPU)",\n                      description: "The "brain" of the computer, executing instructions and performing calculations."\n                    },\n                    {\n                      name: "Memory (RAM)",\n                      description: "Temporary storage used to hold data and instructions actively being used by the CPU."\n                    },\n                    {\n                      name: "Storage Devices",\n                      description: "Used to store data permanently (e.g., hard drive, SSD, USB flash drive)."\n                    }\n                  ]\n                },\n                {\n                  name: "Software",\n                  description: "Sets of instructions (programs) that tell the hardware what to do. There are two main types:",\n                  breakdowns: [\n                    {\n                      name: "System Software",\n                      description: "Manages the computer\'s hardware and provides a platform for application software (e.g., operating systems like Windows or macOS)."\n                    },\n                    {\n                      name: "Application Software",\n                      description: "Programs designed for specific tasks or to solve particular problems (e.g., word processors, web browsers, games)."\n                    }\n                  ]\n                },\n                {\n                  name: "Data Representation",\n                  description: "Computers use binary code (0s and 1s) to represent all data, including text, numbers, images, and sound.",\n                },\n                {\n                  name: "Networks and the Internet",\n                  description: "Computers can be connected to share resources and communicate. The Internet is a global network of networks, enabling communication and access to vast amounts of information.",\n                },\n                {\n                  name: "Impact of Computing",\n                  description: "Computers have revolutionized nearly every aspect of modern life, from communication and entertainment to healthcare, education, and scientific research.",\n                }\n              ]\n            }'),
      ]),
      Content.model([
        TextPart(
            '[\n  {\n    "question": "What is the primary function of a computer\'s processing unit (CPU)?",\n    "choices": "A. Store data permanently.\\nB. Display processed information.\\nC. Execute instructions and perform calculations.\\nD. Accept input from the user.",\n    "answer": "C"\n  },\n  {\n    "question": "Which of the following is NOT an example of an input device?",\n    "choices": "A. Keyboard\\nB. Mouse\\nC. Monitor\\nD. Microphone",\n    "answer": "C"\n  },\n  {\n    "question": "What type of software manages the computer\'s hardware and provides a platform for other programs?",\n    "choices": "A. Application Software\\nB. System Software\\nC. Utility Software\\nD. Programming Software",\n    "answer": "B"\n  },\n  {\n    "question": "What is the primary method used by computers to represent data?",\n    "choices": "A. Decimal code\\nB. Hexadecimal code\\nC. Binary code\\nD. ASCII code",\n    "answer": "C"\n  },\n  {\n    "question": "Which of the following is NOT a common type of storage device?",\n    "choices": "A. Hard drive\\nB. SSD\\nC. USB flash drive\\nD. Printer",\n    "answer": "D"\n  },\n  {\n    "question": "What is the difference between RAM and a hard drive?",\n    "choices": "A. RAM is permanent storage, while a hard drive is temporary.\\nB. RAM is temporary storage, while a hard drive is permanent.\\nC. RAM is used for processing, while a hard drive is used for input.\\nD. RAM is used for output, while a hard drive is used for storage.",\n    "answer": "B"\n  },\n  {\n    "question": "What is the Internet?",\n    "choices": "A. A single computer system\\nB. A global network of networks\\nC. A type of software\\nD. A type of hardware",\n    "answer": "B"\n  },\n  {\n    "question": "Which of the following is an example of application software?",\n    "choices": "A. Windows operating system\\nB. macOS operating system\\nC. Microsoft Word\\nD. Linux operating system",\n    "answer": "C"\n  },\n  {\n    "question": "What is the primary purpose of output devices?",\n    "choices": "A. To store data permanently\\nB. To process data and instructions\\nC. To display or present processed data\\nD. To accept input from the user",\n    "answer": "C"\n  },\n  {\n    "question": "How have computers impacted modern life?",\n    "choices": "A. Computers have had little impact on modern life.\\nB. Computers have primarily impacted entertainment and communication.\\nC. Computers have revolutionized nearly every aspect of modern life.\\nD. Computers have only impacted scientific research and education.",\n    "answer": "C"\n  }\n]'),
      ]),
    ]);
  }

  Future<List> generateQuestions(Map topicContent) async {
    final response =
        await _chat.sendMessage(Content.text(topicContent.toString()));
    List responseData = jsonDecode(response.text!);
    if (responseData.isEmpty) {
      throw Exception("An error has occured");
    } else {
      return responseData;
    }
  }
}
