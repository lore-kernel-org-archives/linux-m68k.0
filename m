Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678E63F7895
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517812; cv=none; b=ORZsg6eG1bu/97iQ1OPnd9LG1E9WBebId/XFgLmleHHbtw9FJx9y10Cg6m/BSytk+gfQeCMK7/fKrz3TLMtH174BZmiiAKFmgI+O50BZpDbLCMl+6nrTwPxKzG/0SfRQOtkCbGPXosbqMNQEw6wq0d8BA5gcC0SY6Ga9vxYWLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517812; c=relaxed/simple;
	bh=yhyQ5E5gTwtMoqYqyOj85N/VFjOffiNcf89Kbn3imTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWQmMOWq7o49SXGZA8OMmdLSED0tDqltvstQfGOWCUI0LP6OjFDqzp6XkWQ+bM3OX0ACiiwty3Ayr1jrhUkDoO8QmwtxEOKbzUvzw9793U3+i+3tQtr5YXddvi88UVrGeAuio9YtKRXeZGfni9jLPpF8Rk3DmmyJrLKWKq18wT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd91bae781so515086e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517809; x=1791122609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SEr1x1TudocYne3WCX5MTGLuJSrLgCYH24KPO9XObHo=;
        b=PQGaBvaqmd2Y/uyalQswmW5yqo4IbIEMCcYLUuc08RCylAIeepGkGajG3kvCfnQbkI
         ioqBpByubh79qMvYKY8pFWEa01litd9p/STW4asDMM03iTW4V/emFRxh8TiDpfmppb7G
         SyBxl+30Z57bkMd3d+rqJ3maVRvLERfCkoK4eo87vAOzSswnDwSQtlP8/trWj3mkl3qG
         /FaEMoCdcbhsYglUoRyrFDfBERkECjbOEci92zXCMplY7fBqDqYlhN2+Pl9F/1w/MlgT
         U6IF5YFNCb/8FJt/3dDJxuKuGJx1JO7hEx0awoxv4tFSqTHACQP3nd71WmvjFU/v7s1l
         65Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxc+sOIl0T4TuoVr4bbGA6Pu54ihwUigbF7WuK2VINQK6MZEkaEl+UZhSaE+7OKZVEhm+JDSPYc1WHA@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYISNMci8/yum1hKjKapxmg2YZHq9AV3FcemW8RJz9RQFS6WaXOW
	j5NtZUN/Rr+TT6FMFfyFRoVnJwn1D295IarYjs8CspMaF+Ax9P3MCJfl1rOC0Lod
X-Gm-Gg: AYBFou33+N9ed8af1A+vLMR/3st0xddP5VeGgSO8XH1RlwpeQd3aVNOY6QhVNUgRhNo
	gfveCmNrFZeW0p2GW01Ds/rlXZlJRbB3oM5HqYkyWjE0frYBdKkBOx7Y0dsItiGzVpkUSAlEGUj
	MJl0AW82hcM6zKwhNRdMq6KPyg5Xbt2rnisF+qvcEdiTC5iUFdgmW7skblOKqkKOy//O008nJVl
	kQSjvM92/+q3YOnL+CDkqV5M2i5YmFHtWPY26iEE50Tu6O5/nWnZt0GzcbMHOhxXJlNfNvm0woQ
	VM9GFZQJpMVsIxILgu+rf2o5j3RFLdBU/+ewMfZlIn3CrrqbgW77mxvlYP3NYQI3OBD3YNcfM4g
	KqhQHslqh6eMUnoU74cPdlZQR4dI1w/VcQ484wUalXfWSrxRNOmqqDFLfpfyEQzk+Lya1b68C86
	zSFr+PNdr+SRiWqcmteF9ZNeZzS72NtY0/YMtFWGWL9lDgs0pipDaMQKA4ea+x6mIktq8qcGWgd
	yV8Mfhdwq6wVGsvsOFvkV53RwHieM6GmEDP
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr4662074e0c.22.1790517809172;
        Sun, 27 Sep 2026 07:03:29 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde5a70282sm5385476e0c.10.2026.09.27.07.03.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:03:28 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-791a9878aa9so577954137.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:03:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy443jOVq4pFgPSoH4SWGoh8zV8k1SFujsiAz4q7s4ipky2GN2pW+aOycu/pZmFjH1XQuqIxbzoPFjO@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6a8a:b0:7b3:32fe:77bb with SMTP id
 ada2fe7eead31-7b332fec22fmr1341342137.27.1790517806812; Sun, 27 Sep 2026
 07:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823163812.3024812-1-visitorckw@gmail.com> <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
In-Reply-To: <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:03:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
X-Gm-Features: AclHuK8wpR6y1eZRM9LOMXOTOPARQG0nffPxefCG8RnAkx6men2t0o6U3_-doY4
Message-ID: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: ast@kernel.org, Greg Ungerer <gerg@polyxeno.com>, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jserv@ccns.ncku.edu.tw, 
	marscheng@google.com, eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Fri, 28 Aug 2026 at 12:50, Greg Ungerer <gerg@polyxeno.com> wrote:
> On 24/8/26 02:38, Kuan-Wei Chiu wrote:
> > Add a BPF JIT compiler for the m68k architecture.
> >
> > The JIT generates m68k machine code targeting m68020+ processors and
> > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > and non-mmu coldfire processors, as it relies on 32-bit branch
> > displacements (b<cc>.l) to handle large bpf programs.
> >
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >
> > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Thanks for your (impressive) patch!

> From here it is really up to Geert now if and when he will pick this up.
> I am happy with this patch in its current form.

Who am I to block this feature? ;-)

> > --- a/arch/m68k/Kconfig
> > +++ b/arch/m68k/Kconfig
> > @@ -8,6 +8,7 @@ config M68K
> >       select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> >       select ARCH_HAS_CURRENT_STACK_POINTER
> >       select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> > +     select HAVE_EBPF_JIT if MMU

Pleave move this to the other "select HAVE_*" lines below, to preserve
sort order.

> >       select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
> >       select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
> >       select ARCH_MIGHT_HAVE_PC_PARPORT if ISA

I think you should also update
Documentation/features/core/eBPF-JIT/arch-support.txt.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
