Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4834DCCD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541136; cv=none; b=f96/SQUkFnccku/iEWaG2btVbBYnCCYNyKjMcKwats7n8LTCiuvF9T2lVUl3tLDAzz/8GUI54Hle9RZNoRspZbVuPBE6LpGOIcBdrVkOoWpAHn1ydPa+U8ZDVPy7PCsK9Yn4nNM1+ORH8hg1JMPgImD/x5FMYJQ0TuogdkpNhEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541136; c=relaxed/simple;
	bh=eAw4W6QjTTBXa5GbZrpw+yuYiwhLLXyJOTNrJ0+leFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN6289fmtbA800dldkwcn5kLIfd8pnWN+OF8D0gu/hBTW1T0+34dUt5hH3Q1ckSpKyI96iMtHvy5+1OaQNW3FRuksUjofDPevBv5L8KhfHzv0DgjsyVPYn8l+wIfh5zx2eCQn553jQUkFj3ktcjbZ9CM6hX1ytyKM8fV/BJPNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGGIlSIU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGGIlSIU"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso1742602a91.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541134; x=1791145934; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAO6WabpD+y/dCbAwrQTwRbR2CnZ9OTMQukOdgoZcZI=;
        b=YGGIlSIU0tAk1xbXgp5nWDcwo3tg+aJPybDlRQ/J/XiVirqGk0IybqqjdQS/O0YRE5
         Yd151MQvLMCP8BkTERwq+TRNHQRQe84PWLu3Z5ER/CDPmCEJ1+unojhm7wCcr9CZjM+C
         2S76R381xWZXPaOqsqzLeJ7ImLrD7uSNBalw0kDepG2tr+pR5mVlj85oz3Qgq8gNuUkm
         LnKhin/CAYd/rdR3d1aMLMmDBSiSN8hx1nPUdTL34ccWII7voesgWbFWoL8o3vfBeAO2
         e//sSGx8RJvSgCNMJjiS1zXQPMTYJ2fZzdy6n1vrzabC5IPWxRSYbOXwtyU9JZam9TYa
         sRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541134; x=1791145934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAO6WabpD+y/dCbAwrQTwRbR2CnZ9OTMQukOdgoZcZI=;
        b=j/slGj068y+m/HfUsprhIV5o/kEWBJ08d7RRdg6pEazMRmuDxmODIsnF/BTu7DIAp7
         nh8MG7eHysJ8nwBjLOIlznKN2z34UG9kPriZeg319FNf63VWMdLt95saWBX0UbpZwS1m
         20tpcce3rtFQdOam+GiQtsNUxPSsrJcYZf2ias3+RXcVYWqv158IuG16YLxgRDiD5BFJ
         N7Km9Oou2/nlxS22ybau2nRUPnTHjEHbWLcObXGY+Eh6gpGxYylYc5IXsj5Jb/zrbg0j
         4I1FS6N7zv2UC7wx+eEdyBGTtrgbdlfqG0z0Y2wJ7VuyHI3skx+2y053KEQmVbQyKn/F
         /3ZA==
X-Forwarded-Encrypted: i=1; AKwUvByO55FrL6nQIWbheFpqkCCo2y7zUtXoRtKznivLTWYALNIDr298br37wYb1Flk9LVILu9i0Xc9jXlON@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYI7Nsk4vH4UT/9ylViZ6H7Pv82kZWtnozToaUx10eF3qCCZ8bgh
	xUa+LdROz39dYks0JehJelE8LI77BSe0XpFrfT9qwkEvPdsvzSoPRbvT
X-Gm-Gg: AYBFou09ZCB1cZoeFuJICvNG9AfbKk+sFPTuFu22dnnMH1t56UtoIRw9MX/Mi9QiqMJ
	+63hpCISKBUtDtqd/09pvd61Eei8I6f73JYpsIUFik/7q0x20gJVWuJbJJXowjGprsfsoqc+TYi
	2RVEE276DKUbzryJm6ItE4I072W75u4T2l81t4PLHpQGXH04pSAm9W6DGQQDjlIJqYtwG0WiNU0
	c4thJL5Sk3iiA5CXSAwzIQwxMX+Fss3HgvXoI6bf0VukohGRHHVAAGtPDu8WthwgzVsacd5aYEI
	hLSAieSlegeOqYy182boEl3oMrkaPove+Wdrex4Nr87iIGC8QYLIqyWnwVq23JTXc4Q2wTq4wNR
	TdxflQWzqURGA62Fw4lZStgcJYim+iUbSfkqfI+XVJzz9N7qH/ur1PLnkin5EmDhtSind0tuz+3
	LWbmWtJfqVZeu6c1UlKc+RGdKRHVtHMIr2gP3pML6WxIkvsbbnn+oCglEF9HAwlExFyUX3wis=
X-Received: by 2002:a17:90b:574d:b0:3a0:2900:f584 with SMTP id 98e67ed59e1d1-3a099230a7fmr10493566a91.46.1790541133971;
        Sun, 27 Sep 2026 13:32:13 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99dcd78sm16818220a91.15.2026.09.27.13.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:32:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 04:32:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ast@kernel.org, Greg Ungerer <gerg@polyxeno.com>, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH bpf-next v5] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <arl9R1pfMU1k7-Ur@google.com>
References: <20260823163812.3024812-1-visitorckw@gmail.com>
 <f89b4e87-12fb-45ae-a2a1-12ebcc483326@polyxeno.com>
 <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6rtJDZUqhLf+-U=9=yTkhJtYUU_Ru1GE=7o0qXu+d6Q@mail.gmail.com>

On Sun, Sep 27, 2026 at 04:03:15PM +0200, Geert Uytterhoeven wrote:
> Hi Kuan-Wei,
> 
> On Fri, 28 Aug 2026 at 12:50, Greg Ungerer <gerg@polyxeno.com> wrote:
> > On 24/8/26 02:38, Kuan-Wei Chiu wrote:
> > > Add a BPF JIT compiler for the m68k architecture.
> > >
> > > The JIT generates m68k machine code targeting m68020+ processors and
> > > coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> > > and non-mmu coldfire processors, as it relies on 32-bit branch
> > > displacements (b<cc>.l) to handle large bpf programs.
> > >
> > > Tested with the test_bpf.ko:
> > > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> > >
> > > Tested-by: Daniel Palmer <daniel@thingy.jp>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> Thanks for your (impressive) patch!
> 
> > From here it is really up to Geert now if and when he will pick this up.
> > I am happy with this patch in its current form.
> 
> Who am I to block this feature? ;-)
> 
> > > --- a/arch/m68k/Kconfig
> > > +++ b/arch/m68k/Kconfig
> > > @@ -8,6 +8,7 @@ config M68K
> > >       select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> > >       select ARCH_HAS_CURRENT_STACK_POINTER
> > >       select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> > > +     select HAVE_EBPF_JIT if MMU
> 
> Pleave move this to the other "select HAVE_*" lines below, to preserve
> sort order.

Ack. Will fix in the next version.

> 
> > >       select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
> > >       select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
> > >       select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> 
> I think you should also update
> Documentation/features/core/eBPF-JIT/arch-support.txt.
> 
I wasn't aware of this doc.
Will update it and send out v6 shortly.

Regards,
Kuan-Wei
