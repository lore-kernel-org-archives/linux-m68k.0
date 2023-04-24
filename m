Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C9DC77B61
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Apr 2023 03:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjDXDwB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 23:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjDXDv7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 23:51:59 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645232684
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 20:51:57 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso5475774b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682308316; x=1684900316;
        h=in-reply-to:mime-version:user-agent:date:message-id:cc:references
         :to:subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icEGQbaZZZU3eMinoYlebQH+Zsqj+hQSs7Sdgu5x0zk=;
        b=Wn1CrZqkhPXz/VMzfGRjSKv/N+taG0C4IswkEKvSJ+yCOY2rT8O34L8ky5Q07BExRp
         CEW62/fpuEt/sxFp76um9My/DKyZqZmrzfcksbDkuZAQgwveQtAjhFv2fhCej7StfkWh
         fBtHuspRSvGPKg2DYDQc8d1jjBcUNopg8ErvNJZIcCjXdVBSq7TDXLV3Vb1NoEGt8hvM
         RblahfZzkRhufcbG86J4r0wWzPnNcaYbNKQpt5lfWhn2fSkIfk+SB1gp7Xy4+Nf7jm5l
         896bcn3F5eHXnIc4fEOzjp0E/y7glz9xCRsczJ/DK9cAdYzBtqVoDCIvhW1QeNmpzfu/
         Kscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682308316; x=1684900316;
        h=in-reply-to:mime-version:user-agent:date:message-id:cc:references
         :to:subject:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icEGQbaZZZU3eMinoYlebQH+Zsqj+hQSs7Sdgu5x0zk=;
        b=EiWx6kc7AD19USUcIuCDFMK4ESSIN1w19CzpJeAPUjR+ruag6MaMvF1i4ivnuHYU5A
         55zZgTBZxSY6i9O58LF7pCdkpjS3zmhCcwemaUquxnF8DrQsCqO2ndorTuviPxQZ0BdI
         Zb43Wk2S+HLvegKn/0C6mTOmMvyjc71ApLT8JpXX4IC9NGzcP1mh5XG/DjdhkvdyBD+J
         HWpR9YrGlwIFS8KzDs0V4T9OqkHG9T5jltpFvn7MqyCjMwqIKz5RsoXSqFNdZrzAUph6
         geH9aobPqR5W2vW252HZExhKUMXBi4BAFeXrysX/dPgKKUUFQGjjcQD7bbntXv7SAUEB
         5RMg==
X-Gm-Message-State: AAQBX9cuC+3EgqYN3VFUNm9HYLABEgcoMZGJvcPM8bVsPU8rzpiAVhii
        LdOmNGaSfILJgzGdmW6AVibqM1gjdjI=
X-Google-Smtp-Source: AKy350bK+9db9yhFV6Wd9AqL5hXptBXA3ewak7FyZmW0mUGcjMZsNOm2vFxQn7fi4fbzt7AOs6LSvw==
X-Received: by 2002:aa7:88c1:0:b0:63d:255f:36f4 with SMTP id k1-20020aa788c1000000b0063d255f36f4mr18062567pff.3.1682308316039;
        Sun, 23 Apr 2023 20:51:56 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id f20-20020a056a00229400b00627fafe49f9sm6381415pfe.106.2023.04.23.20.51.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Apr 2023 20:51:55 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <87y1mj0zxd.fsf@linux-m68k.org>
 <53153bec-90a9-a617-d3af-fe98d8d54632@gmail.com> <87v8hmw9re.fsf@igel.home>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Message-ID: <ee8b7118-2197-0ea2-485f-a87c462384e2@gmail.com>
Date:   Mon, 24 Apr 2023 15:51:49 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87v8hmw9re.fsf@igel.home>
Content-Type: multipart/mixed;
 boundary="------------217F6AD640652372D98FE788"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------217F6AD640652372D98FE788
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 24/04/23 09:48, Andreas Schwab wrote:
> On Apr 24 2023, Michael Schmitz wrote:
>
>> Not sure what third argument you referred to in another mail.
> See struct sigframe and struct rt_sigframe.  The non-rt signal handler
> gets signal number, vector number and sigcontext*.  The rt signal
> handler gets signal number, siginfo* and ucontext*.

Thanks, I see now. Got confused by the sigaction man page (despite 
working out that it's all there on the stack before...). Might need a 
comment in the code (or an update to the man pages).

I've rewritten my test program to make the non-rt handler take three 
arguments, just to simplify things. Also fixed the end of signal frame 
calculation for the non-rt case where the exception places additional 
data on the stack.

Running with the non-rt handler, the crash appears to happen right at 
the end of the recursion (or at least, I take no further SIGCHLD on the 
way back up the stack). With the rt handler, I see the stack depth 
decreased on the last signal taken before the crash.

When I enable dumping the extra exception frame contents (which will 
show prior stack contents when the exception only used a four-word 
frame) in the rt handler case, I only see saved register data placed 
there at the very end. That's different from previous tests where I saw 
the saved register patterns all the time. (but might have had the 
offsets wrong).

I'll see what peeking at the registers shows (now that I can be 
confident I have got the offsets correct).

Cheers,

     Michael




--------------217F6AD640652372D98FE788
Content-Type: text/x-csrc;
 name="movemlrt.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="movemlrt.c"

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <string.h>
#include <ucontext.h>
#include <asm/ptrace.h>

/* how deep at recursion */
int depth = 200000;
const int max_depth = 200000; 
/* how deep still on the stack while returning */
int rdepth = 0;

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

unsigned long parent_usp;

/* extra frame size used for sa_handler case */
static const int frame_size_change[16] = {
  [1]   = -1, /* sizeof_field(struct frame, un.fmt1), */
  [2]   = 4, /* sizeof_field(struct frame, un.fmt2), */
  [3]   = 4, /* sizeof_field(struct frame, un.fmt3), */
  [4]   = 8, /* sizeof_field(struct frame, un.fmt4), */
  [5]   = -1, /* sizeof_field(struct frame, un.fmt5), */
  [6]   = -1, /* sizeof_field(struct frame, un.fmt6), */
  [7]   = 52, /* sizeof_field(struct frame, un.fmt7), */
  [8]   = -1, /* sizeof_field(struct frame, un.fmt8), */
  [9]   = 12, /* sizeof_field(struct frame, un.fmt9), */
  [10]  = 20, /* sizeof_field(struct frame, un.fmta), */
  [11]  = 84, /* sizeof_field(struct frame, un.fmtb), */
  [12]  = -1, /* sizeof_field(struct frame, un.fmtc), */
  [13]  = -1, /* sizeof_field(struct frame, un.fmtd), */
  [14]  = -1, /* sizeof_field(struct frame, un.fmte), */
  [15]  = -1, /* sizeof_field(struct frame, un.fmtf), */
};

static inline int frame_extra_sizes(int f)
{
        return frame_size_change[f];
}

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
		if (fork() == 0)
			exit(0);

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

	rdepth++;
}

static void handler(int signo, int vector, struct sigcontext *ctx)
{
	// use if only taking signo argument  
	// struct sigcontext *ctx = (struct sigcontext *) ((unsigned long) &signo + 24);
	unsigned long *frame = (unsigned long *)((unsigned long) &signo - 4);

	if (signo == SIGCHLD) {
		unsigned long usp, end_frame, extra;
		int i;

		asm(	"	move.l %%sp, %0\n" 
			: "=m" (usp)
			:
			: "memory" 
		);

		fprintf(stderr, "stack depth : %d\n", max_depth - depth);
		fprintf(stderr, "retn. depth : %d\n", max_depth - rdepth);
		fprintf(stderr, "parent usp  : 0x%lx\n", parent_usp);
		/* top of signal stack - including extra size for
		 * exception frames longer than four words
		 */
		// end_frame = (unsigned long) frame + 32 + sizeof(struct sigcontext);
		extra = frame_extra_sizes(ctx->sc_formatvec >> 12);
		end_frame = (unsigned long) ctx + sizeof(struct sigcontext) + extra;
                if (end_frame  > parent_usp)
                        fprintf(stderr, "signal frame overwrote parent usp!\n");
		fprintf(stderr, "frame end   : 0x%lx\n", end_frame);
		fprintf(stderr, "frame start : 0x%lx\n", frame);
		fprintf(stderr, "handler usp : 0x%lx\n", usp);	
		// fprintf(stderr, "signal vec  : 0x%lx\n", vector);
		fprintf(stderr, "signal usp  : 0x%lx\n", ctx->sc_usp);
		fprintf(stderr, "signal pc   : 0x%lx\n", ctx->sc_pc);
		fprintf(stderr, "signal fmtv : 0x%lx\n", ctx->sc_formatvec);
		fprintf(stderr, "\n");
	}
}
            
static void rthandler(int signo, siginfo_t *info, void *ucontext)
{
	ucontext_t *ctx = (ucontext_t *) ucontext;
	unsigned long *frame = (unsigned long *)((unsigned long) &signo - 4);

	if (signo == SIGCHLD) {
		unsigned long usp, end_frame;
		int i;

		asm(	"	move.l %%sp, %0\n" 
			: "=m" (usp)
			:
			: "memory" 
		);
		fprintf(stderr, "stack depth : %d\n", max_depth - depth);
		fprintf(stderr, "retn. depth : %d\n", max_depth - rdepth);
		fprintf(stderr, "parent usp  : 0x%lx\n", parent_usp);
		/* top of signal stack - extra size for exception
		 * frames longer than four words follows uc_filler[54]
		 */
		// end_frame = (unsigned long) info + sizeof(struct siginfo) + sizeof(struct ucontext);
		end_frame = (unsigned long) ucontext + sizeof(struct ucontext);
		if (end_frame > parent_usp)
			fprintf(stderr, "signal stack overwrote parent usp!\n");
		fprintf(stderr, "frame end   : 0x%lx\n", end_frame);
		fprintf(stderr, "frame start : 0x%lx\n", frame);
		fprintf(stderr, "handler usp : 0x%lx\n", usp);
		fprintf(stderr, "signal usp  : 0x%lx\n", ctx->uc_mcontext.gregs[15]);
		fprintf(stderr, "signal pc   : 0x%lx\n", ctx->uc_mcontext.gregs[16]);
		fprintf(stderr, "signal fmtv : 0x%lx\n", ctx->uc_filler[54]);
#if 0
		/* dump frame contents not used for exception frame extra */
		if (frame_extra_sizes(ctx->uc_filler[54] >> 12) <= 0)
			for (i=0; i < 26; i++) {
				if ( !(i & 3) ) fprintf(stderr, "\nextra %d\t", i);
				fprintf(stderr, "0x%lx\t", ctx->uc_filler[55+i]);
			}
#endif
		fprintf(stderr, "\n");
#if 0
		/* dump stored registers */
		fprintf(stderr, "signal stack: 0x%lx\n", ctx->uc_stack.ss_sp);
		fprintf(stderr, "signal usp  : 0x%lx\n", ctx->uc_mcontext.gregs[15]);
		fprintf(stderr, "signal pc   : 0x%lx\n", ctx->uc_mcontext.gregs[16]);
		fprintf(stderr, "signal f.d1 : 0x%lx\n", ctx->uc_filler[41]);
		fprintf(stderr, "signal f.d2 : 0x%lx\n", ctx->uc_filler[42]);
		fprintf(stderr, "signal f.d3 : 0x%lx\n", ctx->uc_filler[43]);
		fprintf(stderr, "signal f.d4 : 0x%lx\n", ctx->uc_filler[44]);
		fprintf(stderr, "signal f.d5 : 0x%lx\n", ctx->uc_filler[45]);
		fprintf(stderr, "signal f.a0 : 0x%lx\n", ctx->uc_filler[46]);
		fprintf(stderr, "signal f.a1 : 0x%lx\n", ctx->uc_filler[47]);
		fprintf(stderr, "signal f.a2 : 0x%lx\n", ctx->uc_filler[48]);
		fprintf(stderr, "signal f.d0 : 0x%lx\n", ctx->uc_filler[49]);
		fprintf(stderr, "signal f.od0: 0x%lx\n", ctx->uc_filler[50]);
		fprintf(stderr, "signal f.sad: 0x%lx\n", ctx->uc_filler[51]);
		fprintf(stderr, "signal f.sr : 0x%lx\n", ctx->uc_filler[52]);
		fprintf(stderr, "signal f.pc : 0x%lx\n", ctx->uc_filler[53]);
		fprintf(stderr, "signal a2   : 0x%lx\n", ctx->uc_mcontext.gregs[10]);
		fprintf(stderr, "signal a3   : 0x%lx\n", ctx->uc_mcontext.gregs[11]);
		fprintf(stderr, "signal a4   : 0x%lx\n", ctx->uc_mcontext.gregs[12]);
		fprintf(stderr, "signal a5   : 0x%lx\n", ctx->uc_mcontext.gregs[13]);
		fprintf(stderr, "signal d2   : 0x%lx\n", ctx->uc_mcontext.gregs[2]);
		fprintf(stderr, "signal d3   : 0x%lx\n", ctx->uc_mcontext.gregs[3]);
		fprintf(stderr, "signal d4   : 0x%lx\n\n", ctx->uc_mcontext.gregs[4]);
#endif
	}
}

int main(int use_rt)

{
	struct sigaction act;
	stack_t ss;

	use_rt--;
	/* poor man's getopt - use none, one or two args */ 
	fprintf(stderr, "use_rt = %d\n", use_rt);

	ss.ss_sp = malloc(SIGSTKSZ);
	if (ss.ss_sp == NULL) {
		perror("malloc");
		exit(EXIT_FAILURE);
	}
	
	ss.ss_size = SIGSTKSZ;
	ss.ss_flags = 0;

	if (use_rt & 2)
		fprintf(stderr, "alt stack 0x%lx - 0x%lx\n", ss.ss_sp, ss.ss_sp + ss.ss_size); 

	if (sigaltstack(&ss, NULL) == -1) {
		perror("sigaltstack");
		exit(EXIT_FAILURE);
	}

	memset(&act, 0, sizeof(act));
	sigemptyset(&act.sa_mask);

	if (use_rt) { 
		act.sa_flags = SA_SIGINFO;
		if (use_rt & 2) 
			act.sa_flags |= SA_ONSTACK;
		fprintf(stderr, "using sa_sigaction\n");
		act.sa_sigaction = rthandler;
	} else {
		fprintf(stderr, "using sa_handler\n");
		act.sa_handler = handler;
	}

	if (sigaction(SIGCHLD, &act, NULL) == -1) {
		perror("sigaction");
		exit(EXIT_FAILURE);
	}

	rec();
}

--------------217F6AD640652372D98FE788--
