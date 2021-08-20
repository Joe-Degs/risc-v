# Handling Functions in RISC-V
Dealing with functions is risc-v is incredibly intuitive, risc-v programming
makes alot of sense to. I've tried learning assembly many times with the
x86 assembly and there was always something that stood in my way, first
it was dealing with stacks and then it was dealing with functions and 
all the other things. It scared me and i stopped.

Now after soo many months, now i'm learning risc-v and everything just makes
sense on two or three trys and it's making me excited to learn more about this
beautiful ISA. 

Let me just recap some of the things i learnt;
- there are 32 register files in riscv
- risc-v has only 32 base instructions, this is called the rv32i. it supports
extensions. basically adding extension increases the instructions and capabilities of the ISA
- the isa provides a bunch of pseudoinstructions that make coding risc-v sweet
- instructions are 4 bytes apart from each other.
- the risc-v memory model has the stack at the highest memory address,
the heap below it (the stack grows towards the heap and the heap grow towards
the stack), static data comes after the heap, text sections comes next and
the reserved section comes last.

### some fundamental steps in callig functions and calling conventions.
- Put parameters in a place where the function can access them. this is usually
the `a0-a7 (x10 - x17)` registers.
- Transfer control to function.
- Acquire local storage for function i.e acquire some space on the stack to put
things that you might need later so they not be overridden.
- Do the processing and put result in registers where caller can access, this
is usually the `a0 and a1` registers. Restore registers that need to be restored
like the `ra and s0-s7` registers if you overridden them.
- Return control to the caller
__There are a fuckton of registers so use them and keep memory use minimal__

### instruction support for functions.
- in risc-v all instructions are `4 bytes` and stored in text section of memory
just like all other data. So this will mean instructions are multiples of 4 apart from each other, this knowledge is relevant for `pc relative` jumps when
coding.
- jumping into and from functions made intuitive and easy just like everything
in risc-v.
- functions are fashioned as unconditional jumps in risc-v assembly. with the
added option to provide links to the next instruction to return to after
executing the function.
Here some pseudoinstructions to make calling and returning from function cool
as breeze.
- `jr ra` -> goto address in register `ra`
- `j sum` -> goto symbol sum
- `jal sum` -> put the address of next inst in `ra` and goto sum
- `jalr rs` -> goto address in register `rs`
- `ret` -> goto address in register `ra`
- `call offset` -> call far-away sub-routine


- Functions called with `jal`, return with `jr ra`.
- The stack is your friend: Use	it to save anything you	need. but leave it the
way you found it.
- Instructions we know so far
- __Arithmetic__: `add, addi, sub`
- __Memory__: `lw, sw, lb, lbu, sb`
- __Decision__: `beq, bne, blt, bge`

- Unconditional	Branches (Jumps): `j, jal, jr`
Registers we know so far: All of them!
- `a0-a7` for function arguments, `a0-a1` for return values
- `sp` stack pointer, ra return address
- `s0-s11` saved registers
- `t0-t6` temporaries
- `zero
