// import path from "path"
// import { Payload } from "payload"

// async function seed(payload: Payload) {
// 	// Exit early to not overwrite data
// 	if ((await payload.find({ collection: "cc-heroes" })).docs.length > 0) {
// 		console.log("🌿 Childhood Cancer data already seeded.")

// 		return
// 	}

// 	const rylanPhoto = await payload.create({
// 		collection: "cc-data-media",
// 		data: {
// 			alt: "Photo of Rylan",
// 		},
// 		filePath: path.resolve(__dirname, "./uploads/rylan.jpg"),
// 	})
// 	await payload.create({
// 		collection: "cc-heroes",

// 		data: {
// 			name: "Rylan",
// 			image: rylanPhoto.id,
// 			summary:
// 				"Rylan is an Upper Peninsula 5-year-old who was being treated for high-risk neuroblastoma. He gained his Angel Wings on July 18, 2022.",
// 			story: "His father is very grateful for the assistance as Rylan received treatment at the University of Michigan hospitals in Ann Arbor, including surgery, chemotherapy, bone marrow transplants, and more. This treatment required lengthy hospitalizations, keeping Rylan and his mom away from his father and siblings for months.",
// 		},
// 	})

// 	const presliePhoto = await payload.create({
// 		collection: "cc-data-media",
// 		data: {
// 			alt: "Photo of Preslie",
// 		},
// 		filePath: path.resolve(__dirname, "./uploads/preslie.jpg"),
// 	})
// 	await payload.create({
// 		collection: "cc-heroes",

// 		data: {
// 			name: "Preslie",
// 			image: presliePhoto.id,
// 			summary:
// 				"On September 12th, 2022, Preslie got to ring the Milwaukee Children's Hospital bell, marking the end of 855 days of treatment!",
// 			story: "The Lions clubs of the UP can help those affected by childhood cancer to “Survive and Thrive”. The UP Lions childhood cancer program has helped many families thus far, including 4-year-old Preslie (in the photo), with funds for travel, food, and medical expenses. On their last day of treatment, children get to ring the Remission Bell at Milwaukee Children’s Hospital.",
// 		},
// 	})

// 	const abramPhoto = await payload.create({
// 		collection: "cc-data-media",
// 		data: {
// 			alt: "Photo of Abram",
// 		},
// 		filePath: path.resolve(__dirname, "./uploads/abram.jpg"),
// 	})
// 	await payload.create({
// 		collection: "cc-heroes",

// 		data: {
// 			name: "Abram",
// 			image: abramPhoto.id,
// 			summary:
// 				"Abram was diagnosed with a choriocarcinoma brain tumor shortly after his first birthday. Despite about nine months of excellent treatment and care, he died peacefully on July 2, 2019.",
// 			story: "As the Johnson family of Menominee mourned the death of their 22-month-old son Abram, they worked to save the money needed to create a very special gravestone. With the help of Menominee Granite Co., and Upper Peninsula Lions Clubs, they purchased a beautiful grave marker that will be engraved with the following poem written by Abram’s mother, Heidi:\n\nWe thought we would watch over you.\nThere is now no need.\nWe thought we would make a straight arrow of you.\nYou fly true without us.\nWe thought to teach you all we knew.\nYou know more now than we ever dreamed.\nWe thought we would bring you to meet the Lord.\nYou see His very face.\nWe thought we would love you forever and ever.\nThat we will.\nWe will.",
// 		},
// 	})

// 	console.log("🌱 Childhood Cancer data seeded.")
// }

// export default seed
