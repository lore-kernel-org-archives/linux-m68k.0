Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DCDC7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 07:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjDVHzC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 03:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDVHzB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 03:55:01 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1971BDC
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 00:55:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b52ad6311so3649490b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682150098; x=1684742098;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=qSKKBPhfO46GfUP8o/hxU6uUynHyikD565mcRfL4Y1o=;
        b=mZ+qbHLFxb9qhlTVfSYnNuO/24vJ7BFKaJFCkqAmM2b4ot0g1wb6jn69vB4fspOrUM
         zZz8Dnb+jJEHDerVC1HcwQ8m0ObA/Cbe0mG1T/NV1sDl9XGfmlBfl/5o/i169RCtYM3k
         5zmWyedxsSIkWWKxk+x3KZMrNt1KvNYidwM4Za+pZMoFAZuu1f0HXPm7vJ+A49zZswPL
         kLV9O87Nj0IEMf3gY3r6YWQoWFH9eCLNwr9/eXQSaR2c/cvBo1bvyphkgh38oJCLkAgp
         uMq5G7oyZF80tN3cWqOfpZQX6hpAQ6GgxeAqwIr1sSdrOrubEX71gg7PVWNYKv3ZDUTD
         y9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682150098; x=1684742098;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSKKBPhfO46GfUP8o/hxU6uUynHyikD565mcRfL4Y1o=;
        b=LYJbcg5PkIpvVxSDqGR/oIa/X3ncRwsirFEP6sOmlSDmvddmwgo1n5OGrxYrRPAHl0
         zqMvH/uLfTcm9lbpUH1YY5nAS2COBkOAU+eTB24X0cjvBkD+Jm8o/HEnVHRNu1vbUx+j
         xdXCS/wmqjyScrPVetR4ORrWP1GCur9gnlkDhLEDI2YZ9PXKtAlrLgjyECqu5/nO9TxH
         xFQo146kYTwbpF3d9xsZYbNNDyckRa8ZQ9b7CfPF9NPnV6RT2KxmjB+aoMVgkTI4l6Zp
         13MjFKhxJb6KWeFMaj57NCM0RFr7P6SeIK2waMbI+UuMrLozTOzctrNVzIsUEmQVMGT/
         RCIA==
X-Gm-Message-State: AAQBX9cr+d4mdVuin6oVGgVMTI+G9zhMi2so3sIDolKuY1wWI6mctgwj
        b8xYglJgV3a+hpu1TUN0kjXDppqu/a4=
X-Google-Smtp-Source: AKy350Y5ZMtfAkUOPqKjwnRgQmEIXkcBc98ydsV1znvdZyDD5/7kWLKWM+F2NL8Gs0lrEWLTn8NvSg==
X-Received: by 2002:a05:6a20:1b26:b0:f0:66c3:7196 with SMTP id ch38-20020a056a201b2600b000f066c37196mr7271097pzb.42.1682150098387;
        Sat, 22 Apr 2023 00:54:58 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id t10-20020a63460a000000b004fab4455748sm3544682pga.75.2023.04.22.00.54.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 00:54:57 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com>
Date:   Sat, 22 Apr 2023 19:54:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------493745C2F0B53EC8F0B000FF"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------493745C2F0B53EC8F0B000FF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 21.04.2023 um 21:18 schrieb Michael Schmitz:
> Hi Finn,
>
> Am 21.04.2023 um 20:30 schrieb Finn Thain:
>> On Fri, 21 Apr 2023, Michael Schmitz wrote:
>>
>>>
>>> How often did a page fault happen when executing moveml, in other
>>> programs?
>>>
>>
>> The printk() I placed in bus_error030() was conditional on the short word
>> at the instruction pointer. It didn't consider all forms of movem, just
>> 0x48e7 which is the start of "moveml X,%sp@-". This matched page
>> faults in
>> many of the programs that executed while booting to single user mode. I
>> suppose most of them don't use signal handlers in the same way dash does
>> otherwise they would probably be unreliable too.
>
> OK; so too much noise unless filtered on the command name...
>
> I'll try first to get register state at the time of signal delivery from
> the sa_sigaction handler's ucontext parameter to see where the signal
> stack falls in relation to the call frames from your rec() function on
> the stack (and what the register contents were). Hope that won't be too

Took a little while to figure out that the ucontext format changed in 
the decade or two since my userland's libc headers were generated. With 
the correct format, the information stored on th signal frame made a lot 
more sense.

Log of your test program (attached), instrumented to keep track of user 
stack pointer in the parent process, user stack pointer in the signal 
handler, and stack pointer, pc and exceptiopn frame format from the 
signal stack (only the last few signals shown):

parent usp  : 0xef97beb8
handler tos : 0xef97bdc4
handler usp : 0xef97bbe0
signal usp  : 0xef97bea8
signal pc   : 0xc009f37a
signal fmtv : 0x800006ca

parent usp  : 0xef969eb8
handler tos : 0xef969dc4
handler usp : 0xef969be0
signal usp  : 0xef969ea8
signal pc   : 0xc009f37a
signal fmtv : 0x800006ca

parent usp  : 0xef9530d0
handler tos : 0xef952fec
handler usp : 0xef952e08
signal usp  : 0xef9530d0
signal pc   : 0x800006dc
signal fmtv : 0x91929394

parent usp  : 0xef945eb8
handler tos : 0xef945dc4
handler usp : 0xef945be0
signal usp  : 0xef945ea8
signal pc   : 0xc009f37a
signal fmtv : 0x800006ca

parent usp  : 0xef933eb8
handler tos : 0xef933dc4
handler usp : 0xef933be0
signal usp  : 0xef933ea8
signal pc   : 0xc009f37a
signal fmtv : 0x800006ca

parent usp  : 0xef921edc
handler tos : 0xef997984
handler stack overwrote usp!
handler usp : 0xef9977a0
signal usp  : 0xef997a64
signal pc   : 0x80000768
signal fmtv : 0xa1a2a3a4

Illegal instruction (core dumped)

usp from the signal stack is below that of the parent process (before 
calling fork()).

usp from the signal handler is below both of those. So far, so good.

The top of the signal frame, however, is getting quite close to these 
stack pointers. In the last log, it has grown above the user stack pointer.

Two things to note:

- pc in the signal frame (from struct uc_mcontext) is either the return 
pc from the stack stuffing function, or something else I cannot work 
out. That part of ucontext appears valid.

- what ought to be the frame format and vector offset does in fact hold 
varying longwords from the user stack. This information is not from 
struct uc_mcontext, but from extra information copied after struct 
ucontext ends. That wouldn't be there if at time of signal delivery, 
nothing had yet written to the area where the signal frame is stored.

It appears that neither format/vector nor other exception frame 
information is stored there by the kernel signal code, so the registers 
that rec() had saved to the stack remain there. At time of signal 
delivery, the user stack appears to have grown into the area used for 
the signal stack, in spite of the user stack pointer saved after setting 
up the registers saying otherwise. I can't figure that out.

At any rate, the constant part of the extra signal stack information 
does not take into account that we may end up storing additional 
information beyond that, in the case that the exception frame that got 
us into kernel mode is larger than four words. Maybe that is why the 
last stack frames logged do have the end of the signal stack go beyond 
the user stack pointer.

The FPU state and exception frame part stored above the ucontext struct 
may well have a different size in your libc headers, or I may have made 
a mistake calculating the size of the extra information stored on the 
stack. You may want to undo my hack to use a local copy of the struct 
declarations and compile with the correct headers, maybe that does 
change the overall picture.

> noisy ... Then see how that changes with bus error handling forcing
> signal delivery.

Haven't got to that bit yet ...

Cheers,

	Michael


> Shame we don't have similar code to find the MMU descriptors on 040.
>
> Cheers,
>
>     Michael
>
>

--------------493745C2F0B53EC8F0B000FF
Content-Type: text/x-csrc;
 name="movemlrtas.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="movemlrtas.c"

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <string.h>
#include <ucontext.h>

/* copies of ucontext struct matching 6.x kernels */
/* no extra stack contents */
typedef struct k_ucontext {
        unsigned long     uc_flags;
	struct ucontext  *uc_link;
	stack_t           uc_stack;
	mcontext_t	  uc_mcontext;
	sigset_t          uc_sigmask;   /* mask last for extensibility */
} k_ucontext_t;
/* extra stack contents (fpu state, exception frame part (> 4 words) */                                        
typedef struct k_ucontextf {
        unsigned long     uc_flags;
	struct ucontext  *uc_link;
	stack_t           uc_stack;
	mcontext_t	  uc_mcontext;
	sigset_t          uc_sigmask;   /* mask last for extensibility */
	long int uc_filler[174];
} k_ucontextf_t;
                                        
int depth = 200000 /* 32768 ; 200000 */;

const unsigned long i0 = 0x91929394;
const unsigned long i1 = 0xa1a2a3a4;
const unsigned long i2 = 0xb1b2b3b4;
const unsigned long i3 = 0xc1c2c3c4;
const unsigned long i4 = 0xd1d2d3d4;
const unsigned long i5 = 0xe1e2e3e4;
const unsigned long i6 = 0xf1f2f3f4;

unsigned long o0;
unsigned long o1;
unsigned long o2;
unsigned long o3;
unsigned long o4;
unsigned long o5;
unsigned long o6;

unsigned long parent_usp, child_usp;

static void rec(void)
{
	// initialize registers
	asm(	"	move.l %0, %%a2\n" 
		"	move.l %1, %%a3\n"
		"	move.l %2, %%a4\n"
		"	move.l %3, %%a5\n"
		"	move.l %4, %%d2\n"
		"	move.l %5, %%d3\n"
		"	move.l %6, %%d4\n"
		:
		: "m" (i0), "m" (i1), "m" (i2),
		  "m" (i3), "m" (i4), "m" (i5), "m" (i6)
		: "a2", "a3", "a4", "a5", "d2", "d3", "d4"
	);

	// note current usp
	asm(	"	move.l %%sp, %0\n" 
		: "=m" (parent_usp)
		:
		: "memory" 
	);

	// maybe fork a short-lived process
	if ((depth & 0x7ff) == 0)
		if (fork() == 0) {
			// note current usp
			asm(	"	move.l %%sp, %0\n" 
				: "=m" (child_usp)
				:
				: "memory" 
			);
			exit(0);
		}

	if (--depth)
		rec();	// callee to save & restore registers

	// compare register contents
	asm(	"	move.l %%a2, %0\n" 
		"	move.l %%a3, %1\n"
		"	move.l %%a4, %2\n"
		"	move.l %%a5, %3\n"
		"	move.l %%d2, %4\n"
		"	move.l %%d3, %5\n"
		"	move.l %%d4, %6\n"
		: "=m" (o0), "=m" (o1), "=m" (o2),
		  "=m" (o3), "=m" (o4), "=m" (o5), "=m" (o6)
		:
		: "memory" /* "a2", "a3", "a4", "a5", "d2", "d3", "d4" */
	);
	if (o0 != i0 || o1 != i1 || o2 != i2 ||
	    o3 != i3 || o4 != i4 || o5 != i5 || o6 != i6)
		asm("illegal");
}

static void handler(int nevermind)
{
}
            
static void rthandler(int signo, siginfo_t *info, void *ucontext)
{
	/* use struct ucontext from libc headers */
	// ucontext_t *ctx = (ucontext_t *) ucontext;
	/* use struct ucontext from kernel source */
	k_ucontext_t *ctx = (k_ucontext_t *) ucontext;
	k_ucontextf_t *ctxf = (k_ucontextf_t *) ucontext;

	if (signo == SIGCHLD) {
		unsigned long usp, pc;
		int i;

		asm(	"	move.l %%sp, %0\n" 
			: "=m" (usp)
			:
			: "memory" 
		);
		fprintf(stderr, "parent usp  : 0x%lx\n", parent_usp);
		// fprintf(stderr, "child usp   : 0x%lx\n", child_usp);
		/* top of signal stack - using ucontext w/o uc_filler
		 * Adding filler (which will take additional exception
		 * frame contents for longer tha four word frames),
		 * top of stack may end up above parent usp! */
		fprintf(stderr, "handler tos : 0x%lx\n", usp + sizeof(struct siginfo) + sizeof(struct k_ucontext) + 24);
                if (usp + sizeof(struct siginfo) + sizeof(struct k_ucontext) + 24 > parent_usp)
                        fprintf(stderr, "handler stack overwrote usp!\n");
		fprintf(stderr, "handler usp : 0x%lx\n", usp);
		fprintf(stderr, "signal usp  : 0x%lx\n", ctxf->uc_mcontext.gregs[15]);
		fprintf(stderr, "signal pc   : 0x%lx\n", ctxf->uc_mcontext.gregs[16]);
		fprintf(stderr, "signal fmtv : 0x%lx\n", ctxf->uc_filler[54]);
		fprintf(stderr, "\n");
	}
}

int main(void)

{
	struct sigaction act;
	stack_t ss;

	ss.ss_sp = malloc(SIGSTKSZ);
	if (ss.ss_sp == NULL) {
		perror("malloc");
		exit(EXIT_FAILURE);
	}
	
	ss.ss_size = SIGSTKSZ;
	ss.ss_flags = 0;
	if (sigaltstack(&ss, NULL) == -1) {
		perror("sigaltstack");
		exit(EXIT_FAILURE);
	}
	
#ifdef USE_ALTSTACK
	fprintf(stderr, "alt sig stack: 0x%lx - 0x%lx\n", ss.ss_sp, ss.ss_sp + ss.ss_size);

	act.sa_flags = SA_ONSTACK;
	act.sa_flags |= SA_SIGINFO;
	act.sa_sigaction = rthandler;
#else
	act.sa_flags = SA_SIGINFO;
	act.sa_handler = handler;
#endif
	sigemptyset(&act.sa_mask);
	if (sigaction(SIGCHLD, &act, NULL) == -1) {
		perror("sigaction");
		exit(EXIT_FAILURE);
	}

	rec();
}

--------------493745C2F0B53EC8F0B000FF--
