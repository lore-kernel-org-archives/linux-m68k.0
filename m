Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9413C9C4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Mar 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410681; cv=none; b=VEZq/kMX0a8qi+adSSzxs11mwnZ4RR4m651/JDtmR2QXS9Pg6e1pN/xlVYtNmn7vsBGMliiRTi7BOMsuRkdLXB1tBk+OFPEFzRLPd7FjW0WHQ8HGDNszcV3d2w2wSwUx+FqtdjupO6TbC8jqBDrMU/mlMvDhvhh08TmTja3mwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410681; c=relaxed/simple;
	bh=l5eqc0C4HMu2i/7Vw0ixdGCDv5mPI6Lkr35xLYnO/IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLEKWuH2mL5E+sUeZBBl3ryfcSkDaIRuwT6BvCWZHteIh3wwjFSVy5byadJDxkeJ6vfFkNhgev57j2YfC7qCKou4MKM6sRMhne2/ZEudmfSOTxqrcEhxmEHRvDxFbdlZLegM0PWPl0b1PZZQ4Gqd9tER01N+CnhslG+uSdXoZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1748156241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Mar 2025 01:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410678; x=1744015478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK/y5pjkyd8lRB9OXOepCyh3Rk+OQD2KlAMo3Fl+x+4=;
        b=HVKvFv+sm8F+5GJeD6VUyD0eazfimMxS3rbpcj4Tja7iHMAez0Y9bM5PkkQBknD42G
         oNzDMxqXU0NTXXkOxJnCBwTjk3tLOlE2YhBZP1NEyn2ooIDopwxK5/tVNz6AZWpxieh9
         +wIgtK402dwq5wYI9YLGae5wlPEalNjDrznJyZ9RtKaiZYgyfYy6D8hFXl/yx7/lZkmz
         yIRYpjDJdw+Pc//Ymd12G2/DUigBphUMcEn3+SXnevjlsTIlx3HMDKsb3BL0HWBuDMkE
         U0nx33MC8vgRBIrt3A0cpJ5GUTdIePOnePUHkdrqbRiFLl3AoAI0fO8esY3GoPIWJxHD
         FqdA==
X-Forwarded-Encrypted: i=1; AJvYcCVqnc4Yfb42elDTJOY44H+d4vD3uOOloelyJ02k0Dd7qURNPZZmU8FdsIOPDo6xCCOhEn1BOyiEbNZo@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwbrAGxzqVuCmtoI7POep5oRGt18ZLU19QEKmoQP9kWlVddvXFY
	WyBZWY27qgpJswCrzhcjO1GvEUjqt7zKT0UEHwu4VdD8qlDQdQ7ypXUCvtYm
X-Gm-Gg: ASbGncuxHXNW5Ful5g1na7XFE1PlLz68Gs3ZS+/tVuceE5KAUBgxTGCFZercEDMVy77
	dvLP8k0IXXxbcRZj3s4VZ2rjPGzhKFYcvE8J9tqHG15kEfTda7+yWWkiH4/oUXehwtST3OkXYaK
	WFkU8HJNSfqJe/PDGrJD8emxcGicLQERXWLl7CTj/BjYl8wdxEaW6phDbBKgbXWnQ1KcGa4gix/
	q0umSQyXQKJH1cZVmBqjETTJsFwtSE9ra/blomBZTjLbqnR5Lw8YJuDfvuvv5sPOAcxIZTTaQrn
	irZRL/1gvv1I6yxLR4eskFf3AoSzN68fKloFzEjn2ecYnMkcaqGhwj5luSF+k/EHJ3tvOyVmt6g
	qFJVF21c=
X-Google-Smtp-Source: AGHT+IGt8yYXQf0Y6dQ976txenyVDePeYlhI1lu0CNfWwzV1zmAQ001EOwAgorGLQ588v1w8qdtVHQ==
X-Received: by 2002:a05:6102:5793:b0:4bb:d062:430 with SMTP id ada2fe7eead31-4c6d35e5e67mr4782292137.0.1743410677963;
        Mon, 31 Mar 2025 01:44:37 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfcb3aa9sm1489095137.11.2025.03.31.01.44.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:44:37 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so1874771241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Mar 2025 01:44:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnlUnP6HXNrtUHwrQLrJzFm7zp110wcOynMCpkaDf4KbHIEWlYMetj7hvSYnatIywtNgOsa+EL7kqV@lists.linux-m68k.org
X-Received: by 2002:a05:6102:149a:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c6d3847bb8mr4591245137.7.1743410677525; Mon, 31 Mar 2025
 01:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
 <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com> <b8150223-8bce-32fb-c146-e14bcaa91134@linux-m68k.org>
In-Reply-To: <b8150223-8bce-32fb-c146-e14bcaa91134@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 10:44:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZV96E4Xu-+yfV-FSO1a0WkJWr87s35M3QQDL-np3chA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq5LoKd7NFb6qFQASTYY2tKI7IkMQW81XTHTmiopvk1xqCDLyhTcF_8r-o
Message-ID: <CAMuHMdUZV96E4Xu-+yfV-FSO1a0WkJWr87s35M3QQDL-np3chA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Fri, 28 Mar 2025 at 23:25, Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 28 Mar 2025, Geert Uytterhoeven wrote:
> > > --- a/arch/m68k/kernel/early_printk.c
> > > +++ b/arch/m68k/kernel/early_printk.c
> > > @@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
> > >
> > >  static int __init unregister_early_console(void)
> > >  {
> > > -       if (!early_console || MACH_IS_MVME16x)
> > > +       if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
> > >                 return 0;
> > >
> > >         return unregister_console(early_console);
> >
> > Perhaps the whole function and the late_initcall() can just be removed?
> >
>
> A comment in arch/m68k/kernel/early_printk.c gives the reason why that
> code exists: debug_cons_nputs() lives in .init.text. Platforms like MVME
> which don't use that function to implement earlyprintk don't have to worry
> about this.

Thanks, I had forgotten about that...

> I suppose MACH_IS_FOO is not a great way to encode that requirement. But
> it don't think it has to be self-documenting. It does have to be
> consistent with the conditionals in head.S.

Alternatively, check if early_console_instance.write() lies within
__init_begin..init_end?
That doesn't work with the current setup, as .write() always points
to the common debug_cons_write().  But it can be made to work
by setting up .write() with the proper function pointer in
setup_early_printk(), getting rid of repeated MACH_IS_*() checks in
the process.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
