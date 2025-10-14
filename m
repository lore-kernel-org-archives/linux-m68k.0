Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C65F2F5322
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Oct 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436733; cv=none; b=EuYSUFmyWMFQqcvlplhX+Hb+lCu8uopPwcGnT+fZHm1m0p+0Lu9MwCnVcsik+8s65EFLu0gnJTxPoULlP/EXEFlWXj9aMniZM1jyOhclAg4mcDD45QrSaz49xd6eI0qD2BK+6/zXDK39rs3F+iScq9e5FRbrxnjRbcVIweAzMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436733; c=relaxed/simple;
	bh=tDZJGyjyFwsEnGU/+BhSU4pXv/ZOaODbT4E16jUaFWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD6CNtBfSv9sYtmnCz+cia0yZRNSaf5mFRohWRaynCqnU7QAcdtAWUthWNK/N9d34afNlF7kZM/IYc2NJS6yDYSqrffqnjUW1fKGfyczvR//pOuzOgzFtzl7C1NXJG7zqSm4vLpFq1tlWFEe+zNACf14DxHlpV6nVPc7GgRXeR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLNCBC60; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLNCBC60"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so36969055e9.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Oct 2025 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760436729; x=1761041529; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmcOUYE96CwkIuciWDdS0GQ43f2j/gyLBNOKfTnV8UA=;
        b=QLNCBC60Wj6tHFSt5/jUQwBWK7wiVQzgObCKUa6Lr+uRr4AR1pvwaSRT5xFOimeqBA
         wXDxhrF+Ik6Q4spaJ9tnYHd2wwdzBetzXMCba8NSeQJNuRb1HjbU/JUCzVnO37HKaKnA
         bTiDZSqFzwjvrMsJ54S4fvA7/zmE2/V08fwPzhKZa8SiTmDx9Ivl6krtp6QKaZX5Q7Lw
         O3DyIqotICDyWaUlZ0sxMG5FOJ43pdWedAcc9qEefL0X6eGxyLdPkFyiSzsAW7DbmpjQ
         nruZXTx2TcBybolbULRmtvUnIyfsoZzm09BcoKONQ7wUrTtJTp9vNFEANIDCuYor9IXD
         Rwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436729; x=1761041529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmcOUYE96CwkIuciWDdS0GQ43f2j/gyLBNOKfTnV8UA=;
        b=P/n/xfbKk2958sKSeSl/hj9bU6c+VAWsCBW0NX++dyrEta4WrjQFQjylo2oSLIjK3E
         7bcoEdJQ6m3AJ2VoMvyCqucOUNGiE9st+xqYa4Z/2ArYGg6E4ZTVNPFGTG89FCbdnGt3
         Tha2HfEHJK7GnXwhtTd6x7B5N/DZVkQNE2L9DgX4ruoqfDfyahIW5MWRU6oRJGoswtQB
         pK/NGCMR0y5KpiHSngCf8rI/wcWoanryw6ENLd7HVGW6xmwRNT37o9jNwNx7wWTdvJC/
         iQNxLDmcmpzW+Va79CGiGQAnU4SCiQqnWxx1zUGnEhdREfCLzDuL1Wj8fPFWFQln//vZ
         RjRA==
X-Forwarded-Encrypted: i=1; AJvYcCUSM7bO4ucrzsUG10XGvkeDEGSk+xXtQ1IArM64t4IwQidxVCdrheF1+ylwAzuOEapn+2UfnJZxJYKa@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxB3R4THGIOzkEoNUCXjLmmVtdRYCXl2EvDfgqR3EhmuJC0KcjT
	8G+S94s2MPLZUmRh4c0mycEWHz31nugT1Rexd/+1X2VnmbeM+deKkesn
X-Gm-Gg: ASbGncuv7sWopuY8EupwUt8daOZD8w4KfkrRbc0G/PjoZa5Gf/E9oUwVq728jXaQvQj
	Tq8Kj4VtX8KcfKEwgbfReKx8IWKlHo0uu+MtDiwPVblJZd9EmDVmT2k7qvFcblc0+2a68CzM8Wy
	enVKwzDSjxDcPSUZVkjPttZGYCquxFdCPQ5VT82DitdC4/r2ptgEVWTtrMUEhC+zeTBwsYISBjo
	LQPpRk+EHKjwBJebGlSIB8HfL2JMPxo3QHGIRDQA2DnABfYqRvqvjpNfgJg7WTKpGGKfbnfVuMw
	y9UhADhzW9Ykm8mNUk5p2fJHkYXe84R3S3WPVvEw9aDH43HN6XKqeF2whJp9s8MC06DWIy4rMYp
	oQ2QpopEjgMIm6FRvqnGKuIiQo3JR+OVFWElZB9lolqBrkKAtkXJtfPmB8GMT0VtQolkEGWNnuf
	ZK0QegH28=
X-Google-Smtp-Source: AGHT+IF6ne/xuQ/Yzz4Zzb7wpstPRXQSA86ePFiRmshMRn4gI9s18XitfechdzacRqFT+6sY8lXeJg==
X-Received: by 2002:a05:600c:3b1f:b0:46e:4340:adf7 with SMTP id 5b1f17b1804b1-46fa9a8b3c0mr176129525e9.8.1760436729180;
        Tue, 14 Oct 2025 03:12:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982b30sm230224825e9.6.2025.10.14.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:12:08 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:11:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lance Yang
 <lance.yang@linux.dev>, Eero Tamminen <oak@helsinkinet.fi>, Kent Overstreet
 <kent.overstreet@linux.dev>, amaindex@outlook.com,
 anna.schumaker@oracle.com, boqun.feng@gmail.com, ioworker0@gmail.com,
 joel.granados@kernel.org, jstultz@google.com, leonylgao@tencent.com,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 longman@redhat.com, mhiramat@kernel.org, mingo@redhat.com,
 mingzhe.yang@ly.com, peterz@infradead.org, rostedt@goodmis.org, Finn Thain
 <fthain@linux-m68k.org>, senozhatsky@chromium.org, tfiga@chromium.org,
 will@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock
 pointers
Message-ID: <20251014111125.731ab016@pumpkin>
In-Reply-To: <CAMuHMdV5o0mA50yeEfG9cH-YUZspEd-OVSDJP-q+H+bxbqm-KQ@mail.gmail.com>
References: <20250909145243.17119-1-lance.yang@linux.dev>
	<yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
	<99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org>
	<CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
	<inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
	<20251007135600.6fc4a031c60b1384dffaead1@linux-foundation.org>
	<b43ce4a0-c2b5-53f2-e374-ea195227182d@linux-m68k.org>
	<56784853-b653-4587-b850-b03359306366@linux.dev>
	<693a62e0-a2b5-113b-d5d9-ffb7f2521d6c@linux-m68k.org>
	<23b67f9d-20ff-4302-810c-bf2d77c52c63@linux.dev>
	<2bd2c4a8-456e-426a-aece-6d21afe80643@linux.dev>
	<ba00388c-1d5b-4d95-054d-a6f09af41e7b@linux-m68k.org>
	<3fa8182f-0195-43ee-b163-f908a9e2cba3@linux.dev>
	<ad7cb710-0d5a-93b1-fa4d-efb236760495@linux-m68k.org>
	<3e0b7551-698f-4ef6-919b-ff4cbe3aa11c@linux.dev>
	<20251008210453.71ba81a635fc99ce9262be7e@linux-foundation.org>
	<CAMuHMdV5o0mA50yeEfG9cH-YUZspEd-OVSDJP-q+H+bxbqm-KQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 09:11:06 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Andrew,
> 
> On Thu, 9 Oct 2025 at 06:04, Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Thu, 9 Oct 2025 10:01:18 +0800 Lance Yang <lance.yang@linux.dev> wrote:  
> > > I think we fundamentally disagree on whether this fix for known
> > > false-positive warnings is needed for -stable.  
> >
> > Having the kernel send scary warnings to our users is really bad
> > behavior.  And if we don't fix it, people will keep reporting it.  
> 
> As the issue is present in v6.16 and v6.17, I think that warrants -stable.
> 
> > And removing a WARN_ON is a perfectly good way of fixing it.  The
> > kernel has 19,000 WARNs, probably seven of which are useful :(  
> 
> Right. And there is panic_on_warn...

Which, like panic_on_oops, panics before syslogd has a chance to write
the error message to /var/log/kernel.
Both are set in some environments.

Tracking down those crashes is a right PITA.

	David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

