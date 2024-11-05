Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63343BBC9
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828714; cv=none; b=ZiwWDyOTDfv2Y0ANsIvkPjIZuzINT4HNwaSVgt1HIiO/lfWnC7boXLutmO/waoAysUjK/aNWg5+EcScItZ89ewX+eUtdwtD0Ip9/4hPztaXge5+NKx5eqRB449gC30RWTr7JM156cmd0BeBH6IlS6B9g67Oxw+Zc2Z9wiNEldQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828714; c=relaxed/simple;
	bh=ecjxMWdhVaLLUuMcptw4/tjpiyom5/R0aaKpCuOg+uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiFZNiTqkM5OrDn+AEuIivDTclbgo4j0w1vhnjnflMml9RO2ggT77PxfJrECcjBVXEJVQutyOnkUNlNEGmLaqztRfA+XliXK9AdVYKfjTIRVw62GLjvu3atYI/MPp7X7Y/Q3JS/nSTkP8M8C0zysYUWr7FI/eVK3hOkVnIy0DF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29218d34f8so24628276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 09:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828710; x=1731433510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+3xEu/L4gA3mcrTWrHcuue6i3EHWLMLRjsPz9s2Jcs=;
        b=DDwstXX4A+Usuom10pOQ6gBDANb97igvHEnpIIicdpHuTCFNzdSyTsqmUVtyfnD2WP
         qGpIZ7IvBafDHu9nvsyiot5/tf6hr8XgIQHHg+ZAS7E9coVTo+TVWXukMs/0LwELa7WO
         LS75pYyd/xXcZBumzX3CWVOhBGoGERSXZfAJa+m+sPlj5InFRFxrIRvRv8SrM6cGImeU
         TuXDN/3qzmWIkfxOUyUQWQdo0fPymbeeAYM/+O0xbrp5XeK5GcicTs0bfN4+rTp+OTdt
         gSTaDaQqKGPqBF7yP3QFGj+tSfpPeS2TwRCQ6+p04zNmD6OtEQhPrB03QThqqryR2KdV
         FI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4toKMQ9qKu0I/IlOBLPmYHxL4nMeQWsU6eoIi7bY7mMKO0iDd1RudSH0AtwrDNvGlpJpdHjJwFarT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzudttmKg7cyOoUM/rGELus1IjAKWK3uNmbgwsDiA0O0usTud8U
	Ir4r5OAzS8Bs8iRFcKgYfKl+kYNZmzEqhkjMnj/7LTM11d4WH1yy5pH/32x/
X-Google-Smtp-Source: AGHT+IHyXqyBIxANabPUeOnpvsEgTM1EDwNBKex2q86DN0w5fxTc0pTbZXzERPKCvfrFTn6al9/CRA==
X-Received: by 2002:a05:6902:4aa:b0:e2e:447b:7048 with SMTP id 3f1490d57ef6-e30e8bd3256mr12728191276.12.1730828710451;
        Tue, 05 Nov 2024 09:45:10 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8a61035sm2520499276.1.2024.11.05.09.45.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 09:45:09 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e35bf59cf6so477517b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 09:45:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOJdxnQbvdJ0kOZmYETaY/oXidb4gVMOSVDMtnC3Lu3aI33uJFxrNCoQp2h0TUF+YlbnScdzFT/7GZ@lists.linux-m68k.org
X-Received: by 2002:a05:690c:740a:b0:6db:da0e:d166 with SMTP id
 00721157ae682-6ea55893852mr166474847b3.12.1730828709297; Tue, 05 Nov 2024
 09:45:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240929025506.1212237-1-daniel@0x0f.com>
In-Reply-To: <20240929025506.1212237-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 18:44:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWz9euGczd0pdEH8=yvK48-TfiQjqDO_RaGsbuuEDHDww@mail.gmail.com>
Message-ID: <CAMuHMdWz9euGczd0pdEH8=yvK48-TfiQjqDO_RaGsbuuEDHDww@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147: Make mvme147_sched_init() __init
To: Daniel Palmer <daniel@0x0f.com>
Cc: gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, fthain@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 4:55=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wro=
te:
> mvme147_sched_init() is only used once at init time
> so it can be made __init and save a few bytes of memory.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.13.

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
