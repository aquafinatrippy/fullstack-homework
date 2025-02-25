import { Crop, Field } from "./types";

const SOIL_SERVICE_URL = "http://localhost:3000";

export const fetchFields = async (): Promise<Array<Field>> =>
  await fetch(`${SOIL_SERVICE_URL}/fields`).then((response) => response.json());

export const fetchCrops = async (): Promise<Array<Crop>> =>
  await fetch(`${SOIL_SERVICE_URL}/crops`).then((response) => response.json());

export const fetchNewFields = async (
  fieldId: number,
  year: number,
  cropId: number
): Promise<Array<Field>> =>
  await fetch(
    `${SOIL_SERVICE_URL}/fields/${fieldId}?year=${year}&newCrop=${cropId}`
  ).then((response) => response.json());
