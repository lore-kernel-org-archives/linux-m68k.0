Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A543AEF2D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jul 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584879; cv=pass; b=qFl8EILxyjD8TlLn2oVgLOWTDPqkHiGq7jjBYesIPS5ksmOp+aFoleFmAKsE1b3jV63CVRicDQTymDoE8Xpo3y6eI6E1fwNydYvSl55ck/AUv92oTiZXlYwajJW4kUpCz1lmF50s8bRxM45vFQthg67OjV16qShMWnmCEx5jJ88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584879; c=relaxed/simple;
	bh=j/7Pu0goIzrDPISYd7UGXNeACZWMCvQbsT7AmxUh2RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7fkT10uo8fQfVOzj+v4+GU4sdVC1rhfoFUs56ELFFldLuQ3LEGw4xwrtqdXITmSZbHzbkCr/VBufMVNXSfQlecAsCtgz4IVxjqg/b2HVOLmjP4ItjxvtO5PitEjHZ7XMgDtrbTV09mBQDmhpvjPSGjqDhHDs72k1tWu1zZMnXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWuEFChT; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWuEFChT"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so11919605a12.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jul 2026 15:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584875; cv=none;
        d=google.com; s=arc-20260327;
        b=QzRyj7V2AdYb1gG5AkAD/HgiNQXtvfm2Ad+zjkzD6168+Iz6uFBbfyFfWurHhXbZWp
         Ic1REl7CEi6pXXLYcKUGHJw7KB+6bnDMu5yC8VnHFE0oemgX/h4+capHFFwONA4liX/t
         O2KcxYeahDQRfkU+A9UaqM9LFimvwDxIWp54JAtVUZxr74HE1s53qHrq1h1eXCfmkd4C
         03npMtjKC4/noK9z+burdadLSQ7RptdjaZYYwx6G/eHcGTFwCNchdqGhHsul4f/3RkLv
         GWPk6cAZvY8wlHHgQvEEIN0GgtmCcaY1bS19GcgkrYSMASYqaWjUNved2vOZfe0PM59j
         EQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        fh=YHB4ug+5C7N6ywLldxLahjGuJb4mPYTADwcGb+JXPrE=;
        b=h3d5pvggfhS6hLmLYKgR23E1vCTHflwVyNMjACImMvBFpe5uCWrCTco/AXzlxpILiR
         3cPWnk1bFyj+XwYgdfN9mG0mRuGp2yIgbhwVjAmQMdHs7IUCyusGut80IsyCJr+lNqOh
         bOzzbkkoD1yZ5HJQzk6psTqhhTinBb4obGafaxer6BJbqpHD6sYtJZoeljmrrPmVjLZf
         VzMxd9R3OTz/cUbA52gIhHbrVziP6GSSun9/suTCQiQlu3I6oENFPBxxn6fdFORL3tx3
         JpqYaEtlKuoB1pEFL/1GJd6cRd/S1tj54bAUBfQXAh4jdKKsUhB/QcFZvKAqrc44P6Qt
         7wpw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584875; x=1785189675; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=kWuEFChT3KXZgZgaVGSKm5m8pnkuGFClttwrOA1KQXweZxlfCTL3v8Z+/3MUNCjStN
         WiTQC4znjz7CILGwwvpLxlcM+CsegJvm5c9620QUdxRRw8tb0mZbDEb30tn4QjhI8vAN
         Ow/Di1ObmRkRyqIHmCANzqmp0rZAmKVJUkFAIdjmCLvMHFP/d5xKXKk4Zbkpum27f4mE
         Zy2huE9LWnqIqBIJoBjYAOFIgiwvckL+BMs5NNbFZfRbiltT1buZ7cX+k/GTXAbZv5ur
         xAUIZSRzIriezfHLraS589AA6bW3fqgNKwtJnagwuU2Pa4BKZ2wQiRkAxbsx2gGcjS5t
         Dn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584875; x=1785189675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=lYkUDBrvjLgtEXwWL3Ev8tvPSnJsMlGOabVY9GvlYALLKc20OFnlycbFkF6n4A/dtH
         xMKrRRhTDg86lzg4U1abtCs6Nllfp2Iwzg2rMa7EklWxn5lDKnufa1ayUrS2UGatk17Q
         EAb8FXcxWdEnEh9SMD+658BP5cgDQM4rMshesG8HFaYa3/QyrJm1swCmz9Qtsp1w9+Ap
         j5/QdDr21+HT/KHGuWkKxVq3wh+KXwWMuCLKFIUoxn7wyr1Wxv6W88Cm0VkQRDL9VQyx
         QUOEjWmDM5Mus7mT+mdt8ZIFqZR4klZgtPkZGrL/D07Us4Y57TW+4tmNnwInU6OD9KLt
         vUbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzJQ18qAXMOKFhst2yvLozmy4Dja4dfpw7XBT5Y4rFWqr2kDE+VCRdE0Yt7eNFCshWqM0jyOFVEgBV@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwNYj8YosDlHeYGBgyMkEdYLbU5y04bV8Azrcarwzun9pKQOS2O
	VLjP1hOmF7dVozj0LEXTZ60ISwctMP9Jjlq/rYBiLf8Pqi3WSy1uKFRGMvWXOJ8XV5iwlc+EfhJ
	Jv9rovm4/SaIQ72HsigMFuGY9pQD/JC8=
X-Gm-Gg: AR+sD12sVQrswXk1QVU6gkTN0RxPq00icvIILcpCsT2tRX7gQuC66T5Kvadp9yke370
	ipaGBJfkRbGN3IYHlYR0pAy339b0YoY07ySLaQ7Kc0nlVFIaC10/wP4Fj7nJKGk2nQ4oeIwCxie
	mZv2mU9ghj/5VkwXpinkvMHRDh3UXYZP/Zd3sSzzj1jbPaev7X+rFbSQDi6SdGgYLXVeUXbsbXN
	bJ7jpMX+XlSVAdJdLOX1S1v2XtQM0P3eSS7urdlX4wIwQYCHxb1DBOsuxpb2FJuoB+e3PVI2anq
	78cw/8GGaO59pIk2eaXVH45GidCvmPk=
X-Received: by 2002:a05:6402:2356:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-69e6525c770mr6536246a12.3.1784584875096; Mon, 20 Jul 2026
 15:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
In-Reply-To: <87wluplb6k.ffs@fw13>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Jul 2026 00:01:03 +0200
X-Gm-Features: AUfX_mw5696pn_wiz_LjCaJHiFU9IchwhNNUbBWmuIdhtqSFIK3TJnj9-atYCBw
Message-ID: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Mon, Jul 20, 2026 at 9:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
>
> Similar to what Peter and me suggested in the related discussion
> vs. s390 which has a similar issue, you can just have a dedicated
> syscall_return member in your pt_regs struct, which is preset to -ENOSYS
> and operate on that. You have an unused padding entry there which means
> it won't even change the size.
>

Thanks, that makes sense in principle.

One complication is that my Alpha GENERIC_ENTRY branch already reuses that
former pt_regs padding slot, while keeping the pt_regs size and stack
alignment unchanged. The extra syscall-entry bookkeeping I needed so far li=
ves
in thread_info rather than adding more fields to pt_regs.

So the padding slot is not free in my current branch. I can still look at
whether a dedicated syscall_return scratch value would be cleaner, but the
tested version currently handles this by setting the default -ENOSYS result
only on the no-dispatch path, after generic entry processing, and only if
ptrace/seccomp/BPF did not already provide a return value.

>
> You were on CC for the V2, no?
>

Sorry, I must have missed that.

> The whole pile including Jinjie's seccomp bypass fix is in
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
>
> and is targeted for the 7.3 merge window.
>

Great!

> If you want to base your stuff on that for 7.3, I can add a tag which
> makes it immutable so it can be pulled into the alpha tree.
>

Yes, please. There is still some ongoing testing/review of my Alpha
GENERIC_ENTRY series, but assuming it is ready in time for the 7.3 merge
window, an immutable tag would be very helpful.

Magnus
