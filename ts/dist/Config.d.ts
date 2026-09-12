import { BaseFeature } from './feature/base/BaseFeature';
declare const FEATURE_PLUGINS: Record<string, any[]>;
declare class Config {
    makeFeature(this: any, fn: string): BaseFeature;
    hasFeature(this: any, fn: string): boolean;
    main: {
        name: string;
        slug: string;
        version: string;
        target: string;
    };
    feature: {
        test: {
            options: {
                active: boolean;
            };
            transport: string;
        };
    };
    options: {
        base: string;
        headers: {
            "content-type": string;
        };
        entity: {
            calculations_module: {};
            economic_complexity_module: {};
            health: {};
            member: {};
            module_status: {};
            route_index_get: {};
            tesseract_cube: {};
            tesseract_module: {};
            tesseract_schema: {};
        };
    };
    entity: {
        calculations_module: {
            fields: never[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: ({
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        economic_complexity_module: {
            fields: never[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: ({
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                                reqd?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: boolean;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    } | {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query?: undefined;
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    })[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        health: {
            fields: never[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        member: {
            fields: ({
                name: string;
                req: boolean;
                type: string;
                short?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
            })[];
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                                example?: undefined;
                            } | {
                                example: boolean;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        module_status: {
            fields: never[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        route_index_get: {
            fields: never[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: never[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: never[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        tesseract_cube: {
            fields: ({
                name: string;
                req: boolean;
                type: string;
            } | {
                name: string;
                type: string;
                req?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                cube_name: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        tesseract_module: {
            fields: ({
                name: string;
                type: string;
                union: {
                    branches: number;
                    count: number;
                    depth: number;
                };
                short?: undefined;
                req?: undefined;
            } | {
                name: string;
                short: string;
                type: string;
                union?: undefined;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                type: string;
                union: {
                    branches: number;
                    count: number;
                    depth: number;
                };
                short?: undefined;
            })[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: ({
                        args: {
                            header: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                                example?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                            params?: undefined;
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    } | {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                                example?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    } | {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            header?: undefined;
                            query?: undefined;
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    } | {
                        args: {
                            header?: undefined;
                            query?: undefined;
                            params?: undefined;
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist?: undefined;
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    })[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        tesseract_schema: {
            fields: {
                name: string;
                req: boolean;
                type: string;
            }[];
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            header: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                            query: {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
    };
}
declare const config: Config;
export { config, FEATURE_PLUGINS, };
