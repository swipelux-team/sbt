export class EnvRequired {
    private readonly name: string;

    constructor(name: string) {
        this.name = name;
    }

    value() {
        const res = process.env[this.name];
        if (res == undefined) throw new Error(
            `couldn't find '${this.name} in your env'`
        );
        console.log(`${this.name}=${res}`)
        return res;
    }
}