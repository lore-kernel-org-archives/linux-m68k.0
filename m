Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E04F344DBD
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Aug 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758015; cv=none; b=czB4NUAg9sQ0m7MzupbRDMzu8g8B/z3eUF6KBtf9ITVmTIjgy1euVhNZyeGDil/30baBXEmIZupYFLNhnUEZTqegEyhnFsd1Z+8TYc0hc0KIjhm0ciMRGte6HizykX3aJBHCK1Rw9qSrrh/nYrb7GpOqgTRuFpU0Jwl29YNCgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758015; c=relaxed/simple;
	bh=ZYteWYIvoP3C+UcugTlS0L+d9scmCwW4Mn6XoJniTIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxZkXJOCEWtPpeeqSj716xoVeTPfRywe0yhLVjXi4JTIpRqrTJu8Lyi49vfx1TJl6AJWfH3tU43UOQsphLJH/vt4SkbE+yxWFnJABkioFRIC+oMKpWk9uPV0i+jG5O8bOb9OmUQgwpWorL4ORHzDagm4YNxDfmPOqSmc/Mc+cBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c2c0e261aeso792396e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Aug 2026 04:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758012; x=1786362812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nF1vhNpaBlVQXaTiQuSq2URjmBitCLtKJIgx6H39Z+U=;
        b=jd3fUIRnXnwQU+lkSveXfkudKDCx9LVs3TcZ28R+3SX4MW60e2wCkVc0ue1McvwOz3
         thUjR1kuhBNTx6FB9w5hEUSQ+u2Kqe6uNN3H6c1daW4QGUbG6LzPTHR2x1TNnOkkjI2O
         WRs7FOfuxX+n1m1QozjnTgNFcxtCwsQ6KJJC0jSqoGjvSzX+3tnCxNXSkA7aT2AWKJq+
         SBJqXlXFiSM/MZHnYy2nSDS7gsFTxOYOUAVEIXoVd8LrAfzzPx4WQ+w1bzPukLyBDDzA
         pkVdJ18p0/M+6JvXWTGsDDpdY6BJfn9binL1j7fJT2jNf02SLAg6wrqqeaNImPqszFhE
         j34g==
X-Forwarded-Encrypted: i=1; AHgh+Rpd9MH+5jC7+flS8G5URsRXcbP97b1NeSayQpnVdv76twrc86flNk0huvpUbSEP/4UfMyXnaDPjZywf@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzW8qwSrkEM0JHoxB+JsnOTTOKLPjU3dEqERMdCU+7mgdqmAeoQ
	gReEM0G/+xCd95GtVb/QTUlStgIv2xQk4oRkIkV2EVrcCFScr/vynsqW27+3Do+j
X-Gm-Gg: AR+sD10dGI5K2DImucSyhmv0jnySBw3f1UuIRNsgNX62NhtKcF6zcqAwF/qIwVT3FYP
	A790n20at87hIFO+rhF5qYIzxrUp0trF6EK3k/BuKY2jqt1yj4A+o4Aop5kmGW7Bi4PsRE89ROg
	poh0X/D4y+MOOteU/M9/VI+XIFVRjmKup+1VNSItEV/7o3nDgHTzJOMveRfjDqep29pFdLeG9IX
	5E7lArQpHG7UICbtaCH2YbL7Wip37VrqSlTX51bUctVnyNsSNeeivSqt39olpYfbjBI0wB6/w7b
	iZ5u9asfZAsi9LMCVNHSrYguqJg7C3/mYoXVzUbV6aBSGJL+FemX7GJftW3yQgbfXqTzy3fsTD1
	W0Z7OI2TDXW5MacFH21/JGdo38W+TMcsJEHtJLz75E8ChaQ8qIFAiXCyqn0MychCLAnpep5rj6n
	RzRmzYT3eBpwwHlIlV/rTrLf0uhwov8uUXL5yQFPRwHZpPRc8LoNvzy2ob6K3QXQvBakMkk2Qjq
	Gf+SvOLN7TgcKPgvs1GYkbUvA==
X-Received: by 2002:a05:6122:6609:b0:59e:372f:6db9 with SMTP id 71dfb90a1353d-5c38785aa7amr2394305e0c.12.1785758012070;
        Mon, 03 Aug 2026 04:53:32 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37edae208sm7808412e0c.13.2026.08.03.04.53.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 04:53:31 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-758caf52714so593978137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Aug 2026 04:53:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLuq65rU/SAgZ1FwBVD2SpwDAKW+m5l0UXfDqCW1vHScH9TeVPB0iMXsueMKiX2qCJPehQOL19n05i@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1591:b0:740:2974:1b19 with SMTP id
 ada2fe7eead31-75b21d62f06mr6144315137.4.1785758011219; Mon, 03 Aug 2026
 04:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728192913.61279-1-deller@kernel.org> <CAFEAcA_8o2A8FDsJKacde+pdj4HzA5c7aTw=k7tmONYXD4=c_w@mail.gmail.com>
 <244987da-f6d8-47a8-ac4a-16a71c660e36@gmx.de> <CAFEAcA9F8rauUNc2NAqbnf1f7-0O_ivft1XOftwt1hW0YWeeJw@mail.gmail.com>
 <a8c13cdc-54c3-4913-bc6e-956cbfe082cb@gmx.de> <89e75011-61fb-4cbc-9583-4117005e58dc@gmx.de>
In-Reply-To: <89e75011-61fb-4cbc-9583-4117005e58dc@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 13:53:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6pwzjmC8cnhxhTNAvHh7yC3_C5LdVe4RbiaZamMUQgw@mail.gmail.com>
X-Gm-Features: AUfX_my3VnNuW4JRO5szmPOHoPyZtpemhqyO-_qjLmVKmfoRw9opDc8LPXNvtiw
Message-ID: <CAMuHMdV6pwzjmC8cnhxhTNAvHh7yC3_C5LdVe4RbiaZamMUQgw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix msqid_ds struct wrt 32-bit big endian architectures
To: Helge Deller <deller@gmx.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@kernel.org>, qemu-devel@nongnu.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-m68k

On Sat, 1 Aug 2026 at 23:39, Helge Deller <deller@gmx.de> wrote:
>
> (Adding Geert as kernel m68k maintainer)
>
> On 8/1/26 22:58, Helge Deller wrote:
> > On 8/1/26 14:11, Peter Maydell wrote:
> >> On Fri, 31 Jul 2026 at 20:36, Helge Deller <deller@gmx.de> wrote:
> >>>
> >>> Hello Peter,
> >>>
> >>> On 7/31/26 20:05, Peter Maydell wrote:
> >>>> On Tue, 28 Jul 2026 at 20:32, Helge Deller <deller@kernel.org> wrote:
> >>>>>
> >>>>> From: Helge Deller <deller@gmx.de>
> >>>>>
> >>>>> Make sure that the time entries (msg_stime, msg_rtime and msg_ctime)
> >>>>> are defined as 64-bit time_t values, since the userspace may access
> >>>>> the whole 64-bit value. By this change we fix the word ordering for
> >>>>> 32-bit big endian architectures as well.
> >>>>>
> >>>>> This fixes the msgctl01 LTP testcase on hppa32.
> >>>>>
> >>>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>>> ---
> >>>>>    linux-user/syscall.c | 30 ++++++++++++------------------
> >>>>>    1 file changed, 12 insertions(+), 18 deletions(-)
> >>>>>
> >>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> >>>>> index 740142825d..c93b770ced 100644
> >>>>> --- a/linux-user/syscall.c
> >>>>> +++ b/linux-user/syscall.c
> >>>>> @@ -4216,21 +4216,15 @@ static inline abi_long do_semtimedop(int semid,
> >>>>>    }
> >>>>>    #endif
> >>>>
> >>>> I see this has already gone into git, but some late review
> >>>> comments. I suspect this is mostly me being confused rather
> >>>> than actual problems.
> >>>>
> >>>>>
> >>>>> +#define target_time64_t         abi_ullong
> >>>>> +#define target_swap_time64(x)   tswap64(x)
> >>>>> +
> >>>>>    struct target_msqid_ds
> >>>>
> >>>> Is this the kernel's "struct msqid_ds" (which it calls "Obsolete, used
> >>>> only for backwards compatibility and libc5 compiles") or its msqid64_ds?
> >>>
> >>> Yes, it's msqid64_ds.
> >>>
> >>>> The layout matches msqid64_ds, which makes our struct a bit
> >>>> confusingly named.
> >>>
> >>> True.
> >>> In a follow-up patch this better should be renamed to target_msqid64_ds.
> >>>
> >>>>>    {
> >>>>>        struct target_ipc_perm msg_perm;
> >>>>> -    abi_ulong msg_stime;
> >>>>> -#if TARGET_ABI_BITS == 32
> >>>>> -    abi_ulong __unused1;
> >>>>> -#endif
> >>>>> -    abi_ulong msg_rtime;
> >>>>> -#if TARGET_ABI_BITS == 32
> >>>>> -    abi_ulong __unused2;
> >>>>> -#endif
> >>>>> -    abi_ulong msg_ctime;
> >>>>> -#if TARGET_ABI_BITS == 32
> >>>>> -    abi_ulong __unused3;
> >>>>> -#endif
> >>>>> +    target_time64_t msg_stime;
> >>>>> +    target_time64_t msg_rtime;
> >>>>> +    target_time64_t msg_ctime;
> >>>>
> >>>> Assuming msqid64_ds, the kernel version of this struct has a comment:
> >>>>    * 64 bit architectures use a 64-bit long time field here, while
> >>>>    * 32 bit architectures have a pair of unsigned long values.
> >>>>    * On big-endian systems, the lower half is in the wrong place.
> >>>
> >>> Those comments are from the generic header:
> >>> include/uapi/asm-generic/msgbuf.h
> >>> and I think the last sentence about big-endian systems is wrong, as
> >>> most platforms provide an own architecture-specific header file, e.g:
> >>> arch/xtensa/include/uapi/asm/msgbuf.h
> >>> and the big-endian platforms seem to have their high-word first.
> >>
> >> The comment is correct for any bigendian 32-bit system that
> >> uses the kernel's asm-generic structure. Maybe there just aren't
> >> any of those that we care about?
> >
> > m68k could be a problem.
> > The other big-arches seem to be handled correctly by the kernel:
> > arch/sparc/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/parisc/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/xtensa/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/x86/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/powerpc/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/mips/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/mips/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> > arch/mips/include/uapi/asm/msgbuf.h:struct msqid64_ds {
> >
> >>>> That would make tswap64() not the right swap for 32-bit big
> >>>> endian guests.
> >>>
> >>> I did my testing on the 32-bit hppa/parisc platform, and with my patch
> >>> the results in qemu were correct and were the same as on physical machines.
> >>>
> >>> I just tried in a 32-bit powerpc chroot and the msgctl01 now succeeds there as well.
> >>> So, I think my patch is generally ok.
> >>
> >> Yeah, 32-bit powerpc also provides its own structure definition.
> >>
> >> I think it's worth having a comment about this, at least, because
> >> otherwise the obvious assumption is that our struct which has
> >> no target-specific ifdefs is supposed to match the kernel's
> >> asm-generic struct.
> >
> > Yes, I will the testing on m68k, afterwards I can come up with a proposal.
> > Maybe it makes sense to modify the kernel comment too....
>
>
> The msgctl01 testcase from LTP gives this preprocessed code on m68k:
> ...
> # 27 "/usr/include/m68k-linux-gnu/bits/types/struct_msqid_ds.h" 3 4
> struct msqid_ds
> {
>
> # 1 "/usr/include/m68k-linux-gnu/bits/types/struct_msqid64_ds_helper.h" 1 3 4
> # 20 "/usr/include/m68k-linux-gnu/bits/types/struct_msqid64_ds_helper.h" 3 4
>    struct ipc_perm msg_perm;
>    __time64_t msg_stime;
>    __time64_t msg_rtime;
>    __time64_t msg_ctime;
>    __syscall_ulong_t __msg_cbytes;
>    msgqnum_t msg_qnum;
>    msglen_t msg_qbytes;
>    __pid_t msg_lspid;
>    __pid_t msg_lrpid;
>    unsigned long int __glibc_reserved4;
>    unsigned long int __glibc_reserved5;
> # 31 "/usr/include/m68k-linux-gnu/bits/types/struct_msqid_ds.h" 2 3 4
> # 53 "/usr/include/m68k-linux-gnu/bits/types/struct_msqid_ds.h" 3 4
> };
>
> but the testcase fails with:
> msgctl01.c:53: TFAIL: msg_ctime = 6a6e65d900000000, expected 6a6e65d9
>
> So, for m68k either the glibc or the kernel is wrong.
> At least they don't agree with each other.
>
> I think it would be beneficial, if the m68k kernel would follow m68k's
> glibc implementation of msqid64_ds.
>
> Helge
