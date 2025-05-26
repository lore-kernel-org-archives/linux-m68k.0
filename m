Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D33C465
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268236; cv=none; b=A9Sis7NxE0ssL7UkZAD4+qUHFELrj1bhiJmTs9a/ERLsg0YOMFDcqLLsmadDa8NBLXJfhM7n0NZxWocFBOj61j1hSWc/5P10Pqu4hy8uhx9CIuRzKifxaEVbsIHlIgj+exobrvO611KNoxQ1ymCQIn0zMhcTP3fdyO4J5sW4EaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268236; c=relaxed/simple;
	bh=M56FL+UpkK56wuTbs3FGjSdEUPCOwsr0dxOYvxuBUrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5jqCYeEfctUTq6CFqY5Aw0CDNqjp7m7s6ZWJgN0vLmV5rcAd5yASVxavcioeEH1s3IJeqtoLCGEOofIq4FonSybNFiGaGaeHtJK8Bd4xmrJBN2r5Dl5eBpEqcFeZBrHXayrNOGG6Q9gSooAxwzMc0AOWY1mfDwRmvAGFNJOC2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40337dd3847so1410415b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 07:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268232; x=1748873032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yw5iSzYbzriDp17/brRyJ5/xBiVxOZLd/jW4wl5BxA=;
        b=ItGS7rZxEt63e2FWooIUf8A+SEw5fAZDCzjMQIakgkVUskgt5fXcXIaPonddWE/wCj
         IZxXV0uHVdSkDgltdrGYNQ9fMvgwgtHs/kIYrQhhAzv9Y9vbgzj6NGVyokwVQxokudTx
         CBbFngqUd0DGS8LXA3dq2MHol7Z23nqB4Q8Wui7uvHfFyDVmpaNcMuWm94R/9cFZdEC3
         yXjS7k3EWyYjJpGzNY2mkJJn1Qyhh/56WqELdhjpJVh7jKyAoO9GTATsx9wh+Ltw9Doh
         JqMTxvSkGgXevqFLpA0Exk2Fj0wtpI7V7zosLlK4riTeXeLxMejmcPJACPsyeP87ikK8
         S90w==
X-Forwarded-Encrypted: i=1; AJvYcCUPPxqYpcZdDA4frfN8/PexXEaVWeE5iAV8OI+wXIcuVTXZ0gJDXCIBBcMXFNkb79VSFUJvkqaOBo8k@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy9VET3SQzGBUEDp20XHt+28Ye5L3TwVobseEO/EsW6zMfvrkcK
	xtdJDRZ0Z/ALsTcF+yBz+BtJmyySoWvm4tn05ME9OahSSyM/Nk2kMZVlDjXrFCti
X-Gm-Gg: ASbGnct5vL5tkK9bD6a7SAMsnh1iIIydwyKzglXLEiw3ichyoaod4y8ZgVixI+nLf00
	lA3o1yY8nCAuMZJdlU2nwdqHFaTy3dAfn97WTIK+xSbze2JZgRACner9pWiAAn334qXEQb84L2V
	EW9FuL1JuQNdsVf600IFwn4cZZYSi6iS5pI6YKc6PW2JKOM6cvQq1Kb4+U5m7ucUJrkXYr3nlRs
	IEoleIPuVxw2N3XAhgIeJp5Kkqi7HzEf9QjOXiYPOHgUbTa58FhV0f27MLlSfyzomxjFQ/j2VE3
	mB3qOHeKkq+4pReBCnMcQCzEB2UO69hlA0ZWw4ylukfXqqJJoF+c1g933TEos7Uiva1d0JXXWbo
	EdEoYAK3H3aGSOLRpJWrml3LW
X-Google-Smtp-Source: AGHT+IGORG1S40ex5hEFgyFsA3wsXTRmcGelEG5tV+nZiSIZmSxFMELgE4L1NokvR/GA7Zf/xvSbPA==
X-Received: by 2002:a05:6808:2289:b0:404:f4a0:7fbf with SMTP id 5614622812f47-40646827871mr5195471b6e.31.1748268232105;
        Mon, 26 May 2025 07:03:52 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-609f303156esm4385041eaf.38.2025.05.26.07.03.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:03:51 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72ec58e45baso1289134a34.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 07:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsNDzZjGsUHhixRXYrXpevChfrwyMUoLvx9Hi7beKKPqLj6NWfiPNtfZVKY8GnYMe0dkf7dGOFmLo0@lists.linux-m68k.org
X-Received: by 2002:a05:620a:3190:b0:7c5:4eee:5409 with SMTP id
 af79cd13be357-7ceecc3c64amr1605591185a.48.1748268219856; Mon, 26 May 2025
 07:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325155613.352680-1-p.pisati@gmail.com> <20250325155613.352680-3-p.pisati@gmail.com>
In-Reply-To: <20250325155613.352680-3-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 16:03:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViC5UYcdca5yHzTYhkNF60sNJOd3y=JMNRn5zfApSEOg@mail.gmail.com>
X-Gm-Features: AX0GCFuoxcpObwYMdx2bQg0VrY-3KmF7-dZUL-LWHGwcdoJt6f4gDNi9UsoTaqs
Message-ID: <CAMuHMdViC5UYcdca5yHzTYhkNF60sNJOd3y=JMNRn5zfApSEOg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] m68k: defconfig: enable PATA_CSWARP
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 16:56, Paolo Pisati <p.pisati@gmail.com> wrote:
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
