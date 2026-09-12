import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { Member, MemberListMatch } from '../DataUsaTypes';
declare class MemberEntity extends DataUsaEntityBase<Member> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: MemberEntity): MemberEntity;
    list(this: any, reqmatch?: MemberListMatch, ctrl?: Control): Promise<MemberEntity[]>;
}
export { MemberEntity };
