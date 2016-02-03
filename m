From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for
 do_sigreturn
Date: Wed, 3 Feb 2016 14:14:33 +1000
Message-ID: <56B17EA9.8020504@uclinux.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
 <8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
 <871t8u7w43.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030305040708000008090305"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.153]:35543
	"EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932937AbcBCEOW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 2 Feb 2016 23:14:22 -0500
In-Reply-To: <871t8u7w43.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------030305040708000008090305
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/02/16 05:25, Andreas Schwab wrote:
> Greg Ungerer <gerg@uclinux.org> writes:
>>> Does it work to use this signature:
>>>
>>> asmlinkage int do_sigreturn(struct switch_stack sw, struct pt_regs regs)
>>>
>>> without changing the caller?
>>
>> No, same problem.
> 
> So this is unrelated to aliasing.  Can you create a test case?

Attached is a test case - derived from the original signal.c code.
I removed a lot to get it to a manageable size. It still exhibits
the problem. I compile this test case with:

  m68k-uclinux-gcc -Wall -mcpu=5208 -fno-strict-aliasing -O2 -c -o signal.o signal.i

I get the same result if I use a m68k-linux-gcc as well (I am
using gcc-5.3 based toolchains).

Regards
Greg




--------------030305040708000008090305
Content-Type: text/plain; charset=UTF-8;
 name="signal.i"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="signal.i"

typedef unsigned int __u32;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned int __kernel_size_t;
typedef int __kernel_clockid_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_size_t size_t;

typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;

typedef struct {
 unsigned long sig[(64 / 32)];
} sigset_t;

typedef struct sigaltstack {
 void *ss_sp;
 int ss_flags;
 size_t ss_size;
} stack_t;

struct sigcontext {
 unsigned long sc_mask;
 unsigned long sc_usp;
 unsigned long sc_d0;
 unsigned long sc_d1;
 unsigned long sc_a0;
 unsigned long sc_a1;
 unsigned long sc_a5;
 unsigned short sc_sr;
 unsigned long sc_pc;
 unsigned short sc_formatvec;
};
struct pt_regs {
 long d1;
 long d2;
 long d3;
 long d4;
 long d5;
 long a0;
 long a1;
 long a2;
 long d0;
 long orig_d0;
 long stkadj;

 unsigned format : 4;
 unsigned vector : 12;
 unsigned short sr;
 unsigned long pc;
};

struct switch_stack {
 unsigned long d6;
 unsigned long d7;
 unsigned long a3;
 unsigned long a4;
 unsigned long a5;
 unsigned long a6;
 unsigned long retpc;
};

struct timespec;

struct restart_block {
 long (*fn)(struct restart_block *);
 union {
  struct {
   u32 *uaddr;
   u32 val;
   u32 flags;
   u32 bitset;
   u64 time;
   u32 *uaddr2;
  } futex;

  struct {
   clockid_t clockid;
   struct timespec *rmtp;
   u64 expires;
  } nanosleep;

  struct {
   struct pollfd *ufds;
   int nfds;
   int has_timeout;
   unsigned long tv_sec;
   unsigned long tv_nsec;
  } poll;
 };
};

struct thread_struct {
 unsigned long ksp;
 unsigned long usp;
 unsigned short sr;
 unsigned short fs;
 unsigned long crp[2];
 unsigned long esp0;
 unsigned long faddr;
 int signo, code;
 unsigned long fp[8*3];
 unsigned long fpcntl[3];
 unsigned char fpstate[(0)];
};

struct mm_struct {
 u32 vmacache_seqnum;
 unsigned long start_code, end_code, start_data, end_data;
 unsigned long start_brk, brk, start_stack;
 unsigned long arg_start, arg_end, env_start, env_end;
};
struct task_struct {
 volatile long state;
 void *stack;
 struct mm_struct *mm, *active_mm;
 struct restart_block restart_block;
 int exit_state;
 int exit_code, exit_signal;
};

typedef struct {
 unsigned long seg;
} mm_segment_t;

struct thread_info {
 struct task_struct *task;
 unsigned long flags;
 mm_segment_t addr_limit;
 int preempt_count;
 __u32 cpu;
 unsigned long tp_value;
};

typedef int greg_t;
typedef greg_t gregset_t[18];

typedef struct fpregset {
 int f_fpcntl[3];
 int f_fpregs[8*3];
} fpregset_t;

struct mcontext {
 int version;
 gregset_t gregs;
 fpregset_t fpregs;
};

struct ucontext {
 unsigned long uc_flags;
 struct ucontext *uc_link;
 stack_t uc_stack;
 struct mcontext uc_mcontext;
 unsigned long uc_filler[80];
 sigset_t uc_sigmask;
};

struct sigframe
{
 char *pretcode;
 int sig;
 int code;
 struct sigcontext *psc;
 char retcode[8];
 unsigned long extramask[(64 / 32)-1];
 struct sigcontext sc;
};

extern void force_sig(int, struct task_struct *);
extern void set_current_blocked(sigset_t *);
extern long do_no_restart_syscall(struct restart_block *parm);
extern int __builtin_memcmp(const void *, const void *, __kernel_size_t);
extern int __get_user_bad(void);

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) struct thread_info *current_thread_info(void)
{
 struct thread_info *ti;
 __asm__(
  "move.l %%sp, %0 \n\t"
  "and.l  %1, %0"
  : "=&d"(ti)
  : "di" (~(((1UL) << 13)-1))
  );
 return ti;
}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) struct task_struct *get_current(void)
{
 return(current_thread_info()->task);
}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) unsigned long rdusp(void)
{
 register unsigned long usp __asm__("a0");
 __asm__ __volatile__(".word 0x4e68" : "=a" (usp));
 return usp;

}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) void wrusp(unsigned long usp)
{
 register unsigned long a0 __asm__("a0") = usp;
 __asm__ __volatile__(".word 0x4e60" : : "a" (a0) );

}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) int _access_ok(unsigned long addr, unsigned long size)
{
 return 1;
}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) int frame_extra_sizes(int f)
{
 return 0;
}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) int restore_fpu_state(struct sigcontext *sc)
{
 return 0;
}

static int mangle_kernel_stack(struct pt_regs *regs, int formatvec, void *fp)
{
 int fsize = frame_extra_sizes(formatvec >> 12);
 if (fsize < 0) {
  return 1;
 }
 if (!fsize) {
  regs->format = formatvec >> 12;
  regs->vector = formatvec & 0xfff;
 } else {
  struct switch_stack *sw = (struct switch_stack *)regs - 1;
  unsigned long buf[fsize / 2];

  if ((__builtin_memcpy(buf + fsize / 4, fp, fsize), 0))
   return 1;

  regs->format = formatvec >> 12;
  regs->vector = formatvec & 0xfff;

  __asm__ __volatile__ (

    "   movel %0,%/sp\n\t"
    "   bra ret_from_signal\n"
    :
    : "a" (sw), "d" (fsize), "d" ((sizeof(struct pt_regs)+sizeof(struct switch_stack))/4-1),
      "n" ((sizeof(struct pt_regs)+sizeof(struct switch_stack))), "a" (buf + fsize/4)
    : "a0");

 }
 return 0;
}

static inline __attribute__((always_inline)) __attribute__((no_instrument_function)) int
restore_sigcontext(struct pt_regs *regs, struct sigcontext *usc, void *fp)
{
 int formatvec;
 struct sigcontext context;
 int err = 0;

 get_current()->restart_block.fn = do_no_restart_syscall;

 if ((__builtin_memcpy(&context, usc, sizeof(context)), 0))
  goto badframe;

 regs->d0 = context.sc_d0;
 regs->d1 = context.sc_d1;
 regs->a0 = context.sc_a0;
 regs->a1 = context.sc_a1;
 regs->sr = (regs->sr & 0xff00) | (context.sc_sr & 0xff);
 regs->pc = context.sc_pc;
 regs->orig_d0 = -1;
 wrusp(context.sc_usp);
 formatvec = context.sc_formatvec;

 err = restore_fpu_state(&context);

 if (err || mangle_kernel_stack(regs, formatvec, fp))
  goto badframe;

 return 0;

badframe:
 return 1;
}

 int do_sigreturn(unsigned long __unused)
{
 struct switch_stack *sw = (struct switch_stack *) &__unused;
 struct pt_regs *regs = (struct pt_regs *) (sw + 1);
 unsigned long usp = rdusp();
 struct sigframe *frame = (struct sigframe *)(usp - 4);
 sigset_t set;

 if (!_access_ok((unsigned long)(frame),(sizeof(*frame))))
  goto badframe;
 if (({ int __gu_err = 0; typeof(set.sig[0]) __gu_val = 0; switch (sizeof(*(&frame->sc.sc_mask))) { case 1: __asm__ ("move" "b" " %1,%0" : "=d" (__gu_val) : "m" (*((unsigned long *)(&frame->sc.sc_mask)))); break; case 2: __asm__ ("move" "w" " %1,%0" : "=d" (__gu_val) : "m" (*((unsigned long *)(&frame->sc.sc_mask)))); break; case 4: __asm__ ("move" "l" " %1,%0" : "=d" (__gu_val) : "m" (*((unsigned long *)(&frame->sc.sc_mask)))); break; case 8: __builtin_memcpy((void *) &__gu_val, &frame->sc.sc_mask, sizeof (*(&frame->sc.sc_mask))); break; default: __gu_val = 0; __gu_err = __get_user_bad(); break; } (set.sig[0]) = (typeof(*(&frame->sc.sc_mask))) __gu_val; __gu_err; }) ||
     ((64 / 32) > 1 &&
      (__builtin_memcpy(&set.sig[1], &frame->extramask, sizeof(frame->extramask)), 0)
                                  ))
  goto badframe;

 set_current_blocked(&set);

 if (restore_sigcontext(regs, &frame->sc, frame + 1))
  goto badframe;
 return regs->d0;

badframe:
 force_sig(11, get_current());
 return 0;
}

--------------030305040708000008090305--
