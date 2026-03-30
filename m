Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470639DBEF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 22:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908554; cv=pass; b=Iqkm//zqFI5MtHlnuIHu7zWdoPXt68amPdbyBLynWQNLaFSRHH3Dmp4SSXb3DNVxupcsVh7ewEAxsDPwqvaypHusds3hviaWfsFeAfnG2mNpF9SxZo9281qLwq6Wn0KMH8nkf85AEdjPkBg/Hl1byFONxYNI+HCxfzbjkC6KqZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908554; c=relaxed/simple;
	bh=npHKTpVwSLXbQNTf6EULU0E1NS6Iba83IvbBkoKcOFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=op4m4iGRWdWVQfRn6pv2cPvrDqNTDEb8VBcQITOpepVN5txp3PZe5PoS14rZ0CZAGs+wSGqXfE+6OYjiSbItYECsVJC8/j999PWKfpTYPZu2sYBIL601lrfFqlU5ndDY+PYeXkGq5xViQNgikr6zDqF8DoOu5eirEygtLKHtdXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=UR0JHZJz; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="UR0JHZJz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso1860175a91.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 15:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774908552; cv=none;
        d=google.com; s=arc-20240605;
        b=ThDA2zFO6kCt4KXoO7uTESlM1m6C9aUzmxpQdznwtNRqc8U/p7N98Ud6hsfe0nHxzV
         sxdRTBQjpdNFzSygqRYLV7JH0kxTSULhV/N71r1u58aOajC9pIGdodzayNMpw1QnkY4m
         YO5hO+NQplkzMFohMGwx5KFJjd6ecnjZ/qHHjqlWXkTAEmJ6XdjJTelSAbpE9EjQcWEh
         fTL9W/gXIiyAuYVQolYozevulAJYIpkdCfwdEFT/FQWBM5aYxIh8m74TOtz84Mxa4BZE
         vBUOZ2IEDACDuvbr0MmLQFPFLJZl09SC49cB8dnD1kF+cDVAYX9Olo27EXDRI7Z6RV57
         LC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=npHKTpVwSLXbQNTf6EULU0E1NS6Iba83IvbBkoKcOFk=;
        fh=gqWKPVVyuhiPQGCLCT6lWkCtTN3lXesiIPL+JjihMys=;
        b=fITcA6J2Je0OcwDx3M66+kyDRg8go8TLQ/VJsv9G0Ky/YEcXCU7Ylu9EAu6B7JB0vP
         jwWn2jReK0v+HRJG0LvxoGICRUOJXetIQvnUfc1Pt83eI7vqkvw2EzHqGf6lGNDSdKaL
         3AsrJtIjY2a9uTBRUqHnpFvoCFsIj8bq2FUILCYXSuM1fhstmC2yVlUeM156/4o8kqfV
         5MuE9fUIHhF844rn8NptmKSnYCdyGjN1ooxaYqOFLNYs05oEm0fH9K33b5aTr+ru3Xnd
         nCt0sCrBg9CF4Eg1v85lGnxiwjlZCmJFBpG+eAvhmNTHajyWRpHouQgQBKH1rVr9OYNp
         cqhg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1774908552; x=1775513352; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=npHKTpVwSLXbQNTf6EULU0E1NS6Iba83IvbBkoKcOFk=;
        b=UR0JHZJzwHqdcauF/HTSeIRaitWBNhSCvfxgOk/dAac3/7xCoczh/x8nNMoN7xGviK
         kFfjkJxscKk3fEGerHvUX3SJ8xdVtw82/OAESTWBO4G6rsXGr0LIiEuyajTKsrcBqQ7S
         vusJQN9EccOLKzARul/+4SLUFBRiXjIac6QiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774908552; x=1775513352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npHKTpVwSLXbQNTf6EULU0E1NS6Iba83IvbBkoKcOFk=;
        b=CbiOOooSgknWQO8UCA3cpunvGa2MxPRAPspC2yWrZdNs9lcCPZYpbBjYMxB/BbNq13
         9DsEOAEriYfcdxtXQCHFqyfTUrzpcu646LtvBFs+XOpn9Xd7PvMHuPbyhbiMWQhCeMOt
         pzYpWONM73mJFypwYR2hgHtomumIXgcQxdqPx0BFATirm43l3ct99esKKEHZsqtw9vmc
         dqcH0bOr/lIpZ+axf5BB4zORdBX8fleqWyZLcIZTQ7qbLm7yy5rMcj5NaAH15L/p+yKR
         1mUa/4IXxtPN9sJdsB27GmPRpI1uHlQIfr2MStGhErnGqo1l6DIeO06jMMgHEKXB6mQq
         QF3g==
X-Forwarded-Encrypted: i=1; AJvYcCWd7Di9sv2/F/sZgcObCytSeOc0ag5lhT1+Fv/0HIT5zUlcQHUzUGF/DKsS2dRS7uzvGSzDkf87SWf6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxp8h6XPgYb+yhPGRz5S34JrxBy9AvEOAK/qT+osr1kjuw/8/FF
	bgPk4kQWatuIQuMaUP65GN2AiNjVhxFwJ5HFa/2PdB586Z4aFBkXJlJKRGGpn75Wi9J09gKAFHo
	s7vFQuS2PkkYfzawp9NOoesgyIzylQELokUWl+RNozA==
X-Gm-Gg: ATEYQzxp0Nn7AcfXrKgkICERhzhXqPPxXzgUOYCGfDecX+Eh0eXKg0c7+Xm8QvStLZS
	53hyxezgNS2A0YzLimJ16C+G850cNI/GHWQhorG73kuANt0G3eTKWBHPEY+JqbmvU0CKXxLLXmo
	wZtDEeJ4xG6SWUOuGvhKELnZgl1QAdax8oblwq6u88zNPe0QYyqVxjKGxUF6UMiRfih00nENKoY
	NnN81t+0d2l7yscnBC80rLBvZTeJsPpvGYo2xWA1lDZ4ZCAVwEjJceAeXJP0YCFyW1ZkNJa4B7h
	apPRIoR3SjyNdBBLM+9bFqwFmY03xe9mWqVe5mtf
X-Received: by 2002:a05:6a20:12c9:b0:39b:c10a:beca with SMTP id
 adf61e73a8af0-39c87a9f1a1mr14419070637.44.1774908551866; Mon, 30 Mar 2026
 15:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312115832.835968-1-daniel@0x0f.com> <10efa219-f7d7-4655-9a48-b4094bf97d47@linux-m68k.org>
 <CAFr9PXnO7y=PUPELb78qA1nN+4qsYqmk036PqXPLogk+L3Sv+A@mail.gmail.com> <c31b5288-7b1c-4139-8ae2-fbcb93411be5@linux-m68k.org>
In-Reply-To: <c31b5288-7b1c-4139-8ae2-fbcb93411be5@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 31 Mar 2026 07:09:00 +0900
X-Gm-Features: AQROBzD4LmHevTiZN6TE0BybL4Q6AQTV5q7asJxJpUPS8wfTUSl4v2vF0rLCQFI
Message-ID: <CAFr9PXnWuvAi_OWzf=XRtoYAMkowVgnsB-Y2hmRuk2TtwQZWzw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix task info flags handling for 68000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, christoph.plattner@gmx.at, 
	linux-m68k@lists.linux-m68k.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, 25 Mar 2026 at 20:25, Greg Ungerer <gerg@linux-m68k.org> wrote:
> Yeah, agreed. The more I look at the ColdFire version the more I think it
> may not be totally correct. Its flow here doesn't match the comments from
> arch/m68k/include/asm/thread_info.h. The legacy MMU m68k code does appear
> to do as the comments say with respect to the TINFO flag bits.
>
> The ColdFire code was forked from the original arch/m68k/kernel/entry.S
> a very long time back - there was some differences that needed to be dealt
> with.
>
> Anyway what I am looking more closely at is if the higher TINFO flag bits
> are actually not being checked at all - so things like single stepping.

For now would it be ok to just fix the reschedule flag for 68000 (i.e.
I send a v2 that loads a single byte instead as you suggested). That
would at least make it usable for me and the other few strange people
using it. :)
I have poked around at converting 68000 to the generic entry stuff. I
think that would make most of this custom asm go away... but it'll
take a while before its ready.

Thanks,

Daniel
