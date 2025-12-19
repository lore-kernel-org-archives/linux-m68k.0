Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094D31B132
	for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Dec 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151018; cv=none; b=P+kX1bHe0JAZz6WaiXtVuvOefJBYOqMcR/qxPNdpjXQFUdKJRfgF6zhfOcGlBX9BHZWw2ad3+VjHeC8BUTzn1V8FRASGYB0IWNr0jN5gGAoczX3npN95NNah471/sBKgHcKt6Ig9bxXFE1KTO0O3+t0CSYEljAZ0ArZPDGiQpXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151018; c=relaxed/simple;
	bh=11HneiaIVO6zcBJ6htTQmP5Cjf8WN7zYsG0NiJhsBAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPIuadKg+wOFUhjVwsH35twcOOLoN4b6653o8OOxzvpm4ynr07ihuNifBKwmsMJ3i9k4xD/uMV8JdGFeYbG3z6Q7uao0htBTIW9BaGP1MpCppODbGaD7MLnH4c0qKxhl8Sgr3NLXXoQq0fhgjZ5OdNtKjqbubsq6CNahhSn//2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=b0fOstij; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="b0fOstij"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so1377330a91.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Dec 2025 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1766151016; x=1766755816; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=11HneiaIVO6zcBJ6htTQmP5Cjf8WN7zYsG0NiJhsBAY=;
        b=b0fOstijh00W/yTbQnhVXr3rS9TwmnLsZVE7EUKEHf8YDSG9GO2o60ItKgIegcGq01
         RXeuaVUkksay0Fmuskr3TluyoBEmI3Z1le1WJWdPt6ikOQAI2lwz76Ga5sGr1IfrDHhZ
         ZYCSuX/nKVsrV0gEnQQ0usIKI8tNRacYKqIuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151016; x=1766755816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11HneiaIVO6zcBJ6htTQmP5Cjf8WN7zYsG0NiJhsBAY=;
        b=QzSFGIfKMENQjXyDimJ5xSh290JFCWTmTUFeYLgHvzGqP5V2MZ9S5JD3rEzzHQw6vm
         NCoXQGV6QZ4PwiNCP440mCJnm3/Ok8TFoCMfUauHIS1W4Am2D39sfIB3mZeDCPBtB9Kd
         0RtQo5464lmgNaZVUWtNK2UMN6+gXsxPKPeRWmZ8ZfBPYr93sqzfsYJOQeLLCr8CKtxj
         PVXPNpeDlK3hhUIPt/XYcTHumlLXfsw1dH2yIgIGJXt7v7QLE44L81KX9MZtLommKoiQ
         3xndT0mutEfdzKh1a1xixHaPglRfb6EopeuuXPWH7ZvhS8iyI2kUb1335Qst6+QUoT+d
         wHtg==
X-Forwarded-Encrypted: i=1; AJvYcCVUzwtppE8B+zLQz7DH2P0pSfptPMV9YJntoRfJ/IwZG6q8ZXxckGWYHEPTdjBQGHdiZM0kDd+11EDH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwcLe/WJcwJ0ztSALcd6ngt0LnqCHj4p6XvKnPeAM3Kd7VAiQXD
	25MumA3kxOC60Ac1o98KQ/7J6Z0FxDQ5dTbVSEM0h3uwOa7GVoKLj+PLvn2cG2Bn9kkFoPpKD5/
	uOaPU10hjVxNJ41U01sdvLIszjFA74i357o8fljjg7A==
X-Gm-Gg: AY/fxX4qz/2lmzj6lEI/4/XqB0mY4SacLdPMnJBcA8zA5drUr2Ve9hMPv5PY89RcvCn
	d/SAhDA4iksIKcwUYMT0s0YLQKE0gAbutAOqnPna59VlPr8X+sOUXzji/CU1r2Ga1OTuXL0wLma
	l8KEOmDR0GuYeZ6C8ilcPpnvaMzUQsq3QibDnqWYrJeSGlAAK/fQqw7cashG30lOFtInWJf75TP
	0zCRUiclfEVH2R1RJuMeOkiuZCGjIEP4pm5GMCfBDnCz3OSR+uPQTkT2BVdF3zTUoFathxexE2g
	gAuiTTOKEqx5zM355JDqBpjdeL+D
X-Google-Smtp-Source: AGHT+IFK+DP//vasllL4orVE+ACcsoXbHksOP6WZFFmbdjqJrRNvAet10aQRooIW+1Zwn2ZovwPWGAF223fKUFk6HqE=
X-Received: by 2002:a17:90b:37cb:b0:32e:1b1c:f8b8 with SMTP id
 98e67ed59e1d1-34e921ddbc3mr2826156a91.26.1766151015715; Fri, 19 Dec 2025
 05:30:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213120401.3992567-1-daniel@thingy.jp> <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
In-Reply-To: <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 19 Dec 2025 22:30:04 +0900
X-Gm-Features: AQt7F2ooWFpWkaVC_NpCMmXW8m8fTYlwDRJJBT9KL0fSkTFetVcE9ipqoi9Zlgc
Message-ID: <CAFr9PX=hfUoqyiVwA5CRoC6mmr4KmYbxvodMmFFk_k8-NGp9cg@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Fri, 19 Dec 2025 at 20:59, Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Daniel,
>
> On 13/12/25 22:04, Daniel Palmer wrote:
> > 68000 has different alignment needs to 68020+.
> > memcpy() checks if the destination is aligned and does a smaller copy
> > to fix the alignment and then critically for 68000 it checks if the
> > source is still unaligned and if it is reverts to smaller copies.
> >
> > memmove() does not currently do the second part and malfunctions if
> > one of the pointers is aligned and the other isn't.
>
> What is the nature of the failure, is it a trap?

Address error because of the unaligned address. This was actually a
real pain to work out because on QEMU it worked fine (mainline QEMU
allows the unaligned access[0]) and on the real CPU it just locked up.

Thanks!

Daniel

0 - https://gitlab.com/qemu-project/qemu/-/issues/2165
