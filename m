Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5611CBD
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727164098; cv=none; b=QtmjD8IaS6naHuMUR865CaYT8EDdsVBeAJWdHNB0X0XL2B4nba8FvIRuxDaLhSSGvJ/CvF/tVwinIear+0rgyleGkI038iVgrInlMcVA4OBt4QdhHMnjiw8HAFciynlbdZFKyAyXvXkKcGYxsuXxU1oQiPtLLkjW83WysoxR17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727164098; c=relaxed/simple;
	bh=GzfUliITS/AjWBFNXjODAUX2WTzfl9ZmwrLuuODou7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJdJSFzekfDAeX+fuoz7dm5M7eL2RLK2YnmHQFcNMLktFdAhCqMb9Yioa5jzHaB2bLbzwPoTqeaG8666A0lp1T1NurFW/qOWVwUtvZ6YPaubM8jwGzEDn9M2JQh9K7OlhXFNV0BVWSqdWoYJnPPWeUCbd699aA+5uFTLU538xY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso4452307276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 00:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727164095; x=1727768895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEEBRQ0kzptclnZPUjTzc9Doy6RNjA1649RxwSFTkiI=;
        b=kAy+fuSx939xYBMS0yfhJ31d1Z+QlUd9qiViRNixRhb52vWDFqGURrCTijl1ryuNCd
         /E49AO5bf3UQFmk13dDQF+9T3DPF9E49gvnU76hioqlwVOYIan2xXlb0tIZkWx/h03qk
         uE2TOXxoKzrnMmtNnSB5YBkF/USt3IzcdndZSmT9zKFmPSbJBFDqiyW4QeMnI8vPoMkR
         PZ1Oso2UbpdfaQwkekWkfxMI4DvFzB5HedfUSX6DMCpVVCXXZipDsf3eAUSW9MfnRkw3
         eBr6ArYQMZ8mMzI1EraEa3I5U1OwekbtJjhVwmEZtYnpXrp7ZDf0GiLQJOEn1cpx6rIs
         uv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFwFKnGQso/Z7JFKxa2rx3P+FzD30x53iSF3V2Y/CfAk5twlZC65jVgZodBkjOrWBR6lscbdmR1Pj4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyOrYyHU8XxXOoNiYjazXzT/C5XfF2DC0MIWEmIBjQOS24/dCmo
	eXCTmCK0hksuVlMTo1DvQewI+SoAvlgHFi+0V7qBJ8JuIF2eUxVnu4JE0fNv
X-Google-Smtp-Source: AGHT+IGGVW/XYEsZ/XnP9tom41yYO6ZJRiQPZ3XrVA6XStFI4Z11wfopLhWtDDuFSrLFD/4xkJ7+Dg==
X-Received: by 2002:a05:6902:200b:b0:e1d:91fe:3288 with SMTP id 3f1490d57ef6-e2250ca82c8mr9373405276.45.1727164095103;
        Tue, 24 Sep 2024 00:48:15 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2499ae6f13sm162923276.1.2024.09.24.00.48.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:48:14 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6de14e0f050so39096577b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 00:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd5AJ8XvNJuHKJVWUNF9wMU1HE64Gqq5d0AozZVIzO0/wRVdHu87ZoW9wFum1PYwUHplwJUL4xBqRM@lists.linux-m68k.org
X-Received: by 2002:a05:690c:700f:b0:6db:ce60:4f8e with SMTP id
 00721157ae682-6dfeed617f3mr115603067b3.22.1727164094228; Tue, 24 Sep 2024
 00:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923235617.1584056-1-linux@roeck-us.net> <aa23abe3-7236-4b9e-b237-3b822ac9d186@redhat.com>
In-Reply-To: <aa23abe3-7236-4b9e-b237-3b822ac9d186@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 09:48:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEfPtwps0A29WvHcwgo3f+3nTBiGn1PFxoYy1dxPsUMA@mail.gmail.com>
Message-ID: <CAMuHMdVEfPtwps0A29WvHcwgo3f+3nTBiGn1PFxoYy1dxPsUMA@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: Define NR_CPUS
To: David Hildenbrand <david@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Sep 24, 2024 at 9:34=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
> On 24.09.24 01:56, Guenter Roeck wrote:
> > v2: Instead of trying to make SPLIT_PTE_PTLOCKS depend on the
> >      existence of NR_CPUS, define NR_CPUS for m68k.
>
> Okay, looks like we're cleaning up CONFIG_NR_CPUS for good.
>
> I'm back from conference travel tomorrow; I'll then throw in the followin=
g
> into cross compilers and fixup any other arch that needs attention:
>
>
> diff --git a/include/linux/threads.h b/include/linux/threads.h
> index 1674a471b0b4..e31715e6746b 100644
> --- a/include/linux/threads.h
> +++ b/include/linux/threads.h
> @@ -13,8 +13,7 @@
>    * bit of memory.  Use nr_cpu_ids instead of this except for static bit=
maps.
>    */
>   #ifndef CONFIG_NR_CPUS
> -/* FIXME: This should be fixed in the arch's Kconfig */
> -#define CONFIG_NR_CPUS 1
> +#error "CONFIG_NR_CPUS not defined"
>   #endif
>
>   /* Places which use this should consider cpumask_var_t. */

This is gonna trigger on almost all architectures if CONFIG_SMP=3Dn.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
