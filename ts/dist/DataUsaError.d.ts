import { Context } from './Context';
declare class DataUsaError extends Error {
    isDataUsaError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { DataUsaError };
