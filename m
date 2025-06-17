Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589F28D8EF
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146063; cv=none; b=m9NOQUaORNiYPunOURFUUZkvA1YKxSIN+l7JqhBmFNKtzirfE22imENwUnyGeGs8QD+Ez0fQXmSCS/Wp47WV6Bxt0IrdztAGh66UAcjUfh/8kAzgdcpbln51MP7C8xI94K3xJCpOXh4OCXRoVz/64zWtkcFa5I1yVAQOlSqbAtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146063; c=relaxed/simple;
	bh=OvIxcnTipst2qgXtF4AZh5QCjqFxVN2WoluyA1CNgjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIWtnQnFURrCnEo82C1RKP2THXZeQvnlZ1lSAKL7v5uSzHCHPCGsv0hlcX8k5d9zm7UVbQw8ertTCJ1Hsk4QacRqriHHufO3yQnjf/jHrCoy+RL3+h+w3thdMdsglvckL55SqHVwNyq7/RNw10u8Y/ZrfEwqCm7JZqZzIDuTu2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f36c458afso1133031241.1
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 00:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146058; x=1750750858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmyMMbgnjr3QF5O/4rDtlR9LUvWg8JU7nalUDuC/65U=;
        b=bs+GO7tvue9yAYAvtX7SEdTa2CDEi+V3ws2Stb9jrQcBUxSDKE0SC9smJxlzY2ztZ1
         GBU+2Yj7Iq07YXkSHQyXRGqJWMnIAnexATLNgcZ7KBmley2OXS4mwVHfDvyGmNP4lq4Z
         z0czohPZ972oGLAQ6BZzTZPdqSU1vZMczm5zs4JPc44NmU/gl65+3Ms+0Cnb1fW6kLnh
         xAVebW6QSr6dLkLRHqSTQ3BHKOI3c41s/SCly6Kpdx0RROWLT6SGQlYnN3yCnKI/vKUP
         ieuFkIU+axiz46qjwz7GwvG9969f8TlPlYPtQjxpxq1hQnqtzS9BncepnCuen0Hyunk6
         9kAA==
X-Forwarded-Encrypted: i=1; AJvYcCXkJMix09xinQlQXMc4ivmWTnY53L/7jQVbUWr9uGl19W5jbk8PPttBpvm3CI2D4SseOZc50YJ3ptNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbuO3YxZPC5+zu62CaoNmbQgp835VDSnoy3Pz/5Xd+b0QDUe1
	rGf5SPr+d09/PE8ILbKSJy00DbnD7uNJ1HQQP6EUDcIA4OnbDz0oHxYYhaXw9LGa
X-Gm-Gg: ASbGncu0e11G59+oAK6z8w1HhL/zlAxBFu9Q94G/g5ll29sTwR3wheqfbHBPXi0tMid
	7qKnvqmV3KJdRd2uCRMpzRnDdEVEf7cLu1Au8WMffOA6TmTz+gkK3QuevaVNojFjgMEsAjshJmp
	0hgBcaFa10D3ChymW+DQSrKWbn+49u1GQWWI7dGnrQtyB0f/+87oOLLi3hmwMr3KTnPZIJJU7y8
	9yC1YM2WlvQFerpSrTPK+ILB7YrsVEdz3ExRHQTX5xWiuXS3NIp1QAIN09YkHzqKbFPky0Ati9f
	8WXuoV/z2WA7ks6ruqp6eKtnHxKTPVMpA+Lb/PZ7x+pHt130csooVyYBGUr2fHY4DGlDIm6mT/F
	8tTDF7Y3DnieJ4r/TE9O6Nfpq
X-Google-Smtp-Source: AGHT+IF85hc0Qp7ixwB8Dwn9NWK27DTkdE2rbC1f0Q/rXUeaYdULCIgLf2EdwR4UUXBEeZB3NCPv0w==
X-Received: by 2002:a05:6102:5349:b0:4e5:9b5f:a7a2 with SMTP id ada2fe7eead31-4e7f61629a4mr9031207137.9.1750146058490;
        Tue, 17 Jun 2025 00:40:58 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f2fface76sm662453241.12.2025.06.17.00.40.57
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:40:57 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e80ef8df69so1766207137.3
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 00:40:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmgUAzYoD5Zrndy4TWoRcPo/oaFnCKBrVRSTbOVl37Xi0FehpHV0eQtzvBrMRTitz1fUlLA65h9bWx@vger.kernel.org
X-Received: by 2002:a05:6102:2b8e:b0:4e2:8b49:9f96 with SMTP id
 ada2fe7eead31-4e7f6160f1fmr7302403137.6.1750146057586; Tue, 17 Jun 2025
 00:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <8734d1kofn.fsf@oldenburg.str.redhat.com> <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org> <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org> <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com> <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
In-Reply-To: <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:40:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
X-Gm-Features: AX0GCFvp4eKaedMO8hEG4ETzmr2kdCHHevTIXzAzxphGJhOjmR8QefwfcBTJ3yU
Message-ID: <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 17 Jun 2025 at 09:25, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-06-17 at 09:02 +0200, Geert Uytterhoeven wrote:
> > On Wed, 21 May 2025 at 04:15, John Klos <john@klos.com> wrote:
> > > Should Linux maintain a 32 bit platform that has alignment issues because
> > > programmers make bad assumptions?
> >
> > Linux (the kernel) does maintain it, and bug fixes are backported
> > to stable trees.  The upstream kernel (outside the arch/m68k dir)
> > has no problem fixing whatever alignment issues that pop up.
>
> This might change in the future when Rust code becomes more dominant in the kernel.
>
> What's going to happen when Rust code becomes mandatory in key parts of the kernel
> and then we're unable to build it because we insisted on keeping the 2 byte ABI?

We fix Rust? ;-)

Is this a Rust issue, or an LLVM issue?
In case of the latter, how does llvm-mos handle this?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
