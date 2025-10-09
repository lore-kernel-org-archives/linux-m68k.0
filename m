Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40221E492A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Oct 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759993882; cv=none; b=E+J/+8CU26ixghFjgmj20SripBNkxduaLyxCy/GCxzyxomMHzkNgqbwC28VQefETXERA3XhX8h6fKuKKqepoGyc/YX8PwyeSktRwCzhUGh4+P2S/PHxY4rk6VgxPnYX/8vLGiHihLP9wpnR+t5JAGiuddVkZDf1ZBrDIYtZ4D8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759993882; c=relaxed/simple;
	bh=vHsLC2ZZf3R3Cazh2jOIeRCeKj5FEq8IfCJ5bB8jxzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6KHt4C3/ndPctzy2GUipVBxtNpXUcyM2jzWXgH9ptO4jjJEjCabDj3j/3fSz168uj+adOIXXUOfM3jxSyzGNVn83mG6vVjbeUpH0KS11mNX2+K7ax29FlViewfNO5ofcdqS0u4z9DGjjZkK9A8c/1xwt4gQ57cfgho0iuMfrvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so504954241.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 00:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993879; x=1760598679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLfLe9mIdxe47Pj3LvR4pabCTnZl5QqVr+O+If4CSm8=;
        b=jKC6PJCbzsTKbuHGfVTXegCfdD0SZXPJkRwKYWfTUiBWhbH8DL48p8C5dN7AVSM6Re
         ml66eyAQKwmH1lmBxgStyzbcOUNDK5YTPaSOhAvt3EtWRxEm4NfX5m1feJxT21kv0SJd
         D4DBihLDq3reHi1NtQIsIgoCcCdZ30ys7wsIA9tQsV7iH/+k3/LK2IOC7E0NxrjTxMrS
         MEsAjD5QM3x8wVsjFnBsFLqru8+PhDf19yoQdsQ+yGPVHMYHk8lO6gRbBi8coT6UKKUq
         C5cUIXwnHqT2VEEFEu9k1LIpaSbijyjuc1Zwizu/fc1xqA/jChFReWrp2oleoc22ITAm
         ahag==
X-Forwarded-Encrypted: i=1; AJvYcCV7L3lgJHhLAEQir5iZTDLeEb2ChagrAjts22TDXDJWZobLJcVljcVjCAQUpi49kS2WP/6SOdi7nOvn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz/1SmJA+0tUt72xlO8KynCEo41Zz+V/gnt3T9ByqGZFlxRm9bQ
	nvn48vqunddIiRRDdRRiUVjxcckF48eWL7q6p3Se5eXbagkeo6cyKgY/AJlELZTu
X-Gm-Gg: ASbGncsag4aGRQmw+WscKgVF7WoObHiWHesLArpHodqdLtOVP9aQj3sJc2GGY+N8stw
	1M68FtPQH/oD+9OpNt3MO5XXC663Z9X6za1aEPnWMOhqpcaoJRpxobTXIxxsHfdUFdKf4iXoZGs
	lfb7kEMvfjGrQsndUUZ0dq4QmiQp5aKjFDdFppIuiAcWcJJ758xmdpETypyPgV4iIFd6HoT9Piy
	pPoCS7yeL0U7eZApg82gZfyQ45cekhzT+uNau86+x5GlpDEv4CXrPJw0xlXmcZUVdNOCG6bBuuW
	KooQ3BSo2O/D6zoSdR4JAE6czoEoPSgxYXGPrBKZwL9dcyZmRBw/sem+zzOMkMBN8KJCRjaVRcI
	fYR2JiTwLR5AisFdn3UY5aCOh/ARCOWHtZeXHTpzj5jWbjuzdIQtrjaq6THNvNkby+uFLpfcR60
	8+HyhetZ0X4kSBUkcd04NPCpY=
X-Google-Smtp-Source: AGHT+IH6Jg4YMJgDcmCQkCNqNjrMumsypwS1WE3lMltExMlfAVxny8fEYFA1T6fzGmyIAmoiJB0TfQ==
X-Received: by 2002:a05:6102:1a06:10b0:584:7aa3:a329 with SMTP id ada2fe7eead31-5d5d4c81309mr3899880137.4.1759993879140;
        Thu, 09 Oct 2025 00:11:19 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4ee14e6sm4704268241.16.2025.10.09.00.11.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:11:18 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so633252e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Oct 2025 00:11:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5Lx71BAvxfgatg5o25rhh4NX8HQ9ZWtD/ZAY3VwM9xhMk0dg6rnHt6oWSecg0mQqEn/1x6nRP02ZW@lists.linux-m68k.org
X-Received: by 2002:a05:6122:a0e:b0:552:361e:25fd with SMTP id
 71dfb90a1353d-554b9193d05mr2881875e0c.2.1759993878614; Thu, 09 Oct 2025
 00:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909145243.17119-1-lance.yang@linux.dev> <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <99410857-0e72-23e4-c60f-dea96427b85a@linux-m68k.org> <CAMuHMdVYiSLOk-zVopXV8i7OZdO7PAK7stZSJNJDMw=ZEqtktA@mail.gmail.com>
 <inscijwnnydibdwwrkggvgxjtimajr5haixff77dbd7cxvvwc7@2t7l7oegsxcp>
 <20251007135600.6fc4a031c60b1384dffaead1@linux-foundation.org>
 <b43ce4a0-c2b5-53f2-e374-ea195227182d@linux-m68k.org> <56784853-b653-4587-b850-b03359306366@linux.dev>
 <693a62e0-a2b5-113b-d5d9-ffb7f2521d6c@linux-m68k.org> <23b67f9d-20ff-4302-810c-bf2d77c52c63@linux.dev>
 <2bd2c4a8-456e-426a-aece-6d21afe80643@linux.dev> <ba00388c-1d5b-4d95-054d-a6f09af41e7b@linux-m68k.org>
 <3fa8182f-0195-43ee-b163-f908a9e2cba3@linux.dev> <ad7cb710-0d5a-93b1-fa4d-efb236760495@linux-m68k.org>
 <3e0b7551-698f-4ef6-919b-ff4cbe3aa11c@linux.dev> <20251008210453.71ba81a635fc99ce9262be7e@linux-foundation.org>
In-Reply-To: <20251008210453.71ba81a635fc99ce9262be7e@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 09:11:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5o0mA50yeEfG9cH-YUZspEd-OVSDJP-q+H+bxbqm-KQ@mail.gmail.com>
X-Gm-Features: AS18NWCQgTe_ntCJBOH_V5jiAjzJoJEeK5wkQ-O8aRmmail08XldJV7y3wHkl-Q
Message-ID: <CAMuHMdV5o0mA50yeEfG9cH-YUZspEd-OVSDJP-q+H+bxbqm-KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock pointers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>, Eero Tamminen <oak@helsinkinet.fi>, 
	Kent Overstreet <kent.overstreet@linux.dev>, amaindex@outlook.com, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, ioworker0@gmail.com, joel.granados@kernel.org, 
	jstultz@google.com, leonylgao@tencent.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, longman@redhat.com, mhiramat@kernel.org, 
	mingo@redhat.com, mingzhe.yang@ly.com, peterz@infradead.org, 
	rostedt@goodmis.org, Finn Thain <fthain@linux-m68k.org>, senozhatsky@chromium.org, 
	tfiga@chromium.org, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 9 Oct 2025 at 06:04, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 9 Oct 2025 10:01:18 +0800 Lance Yang <lance.yang@linux.dev> wrote:
> > I think we fundamentally disagree on whether this fix for known
> > false-positive warnings is needed for -stable.
>
> Having the kernel send scary warnings to our users is really bad
> behavior.  And if we don't fix it, people will keep reporting it.

As the issue is present in v6.16 and v6.17, I think that warrants -stable.

> And removing a WARN_ON is a perfectly good way of fixing it.  The
> kernel has 19,000 WARNs, probably seven of which are useful :(

Right. And there is panic_on_warn...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
