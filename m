Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AD39AC1
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jan 2024 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f68e2e1749so25109177b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jan 2024 06:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810439; x=1705415239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSNpQrjMxu38IObUGMmHZtLYKM7CsitQLNIL1x6OifQ=;
        b=fBpnZDM9OPf6mynL7seECnGtA5cjvaervcRTXvXP/HMfV1UmjPavLTrm3VW2+gJZts
         PgnVx0GPxnjwCJa2a9SwgHG4dl4NaCYyDrnuPwK2lJ6SYTH9wpRmTGhf3FCAq1/k7N2y
         zSbcYZ3yJOKU2x73MWkQW7+q2o46NP9HDgWiWjfbLGwfDEFtKVcgMO4xTTutnSQdVEys
         9eXYBQn8MY1b+BexOPAzz6c19dMfMi2bOwDtI7xqGUNMBV1J/OwzYXxTr+ss5rdbG3Og
         HV9jjHHH8Qldyb2YIfgHiVIvriDi4X0wHoEzIMC9yuoR4VbfmrBzcsTvvoPExvMW5feg
         NWvg==
X-Gm-Message-State: AOJu0YzFNEMuJNGcR42A4PpEStXXt5u+jAQMpRMzmfcX0LLWfHZwQPKR
	KaqNUmNZ1za8vnc7XxkhJ5IJAafIVoAWdFqZ
X-Google-Smtp-Source: AGHT+IEvFBBiqpsjbGta+a0uSu6PdoIQvS1QUFnPO9Ksek0A9LiNUuC9rQ2SK5sO/lppj67yZ9r1lQ==
X-Received: by 2002:a0d:f247:0:b0:5ee:b1f:436b with SMTP id b68-20020a0df247000000b005ee0b1f436bmr3664247ywf.77.1704810439314;
        Tue, 09 Jan 2024 06:27:19 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id v187-20020a0dd3c4000000b005de8c10f283sm783123ywd.102.2024.01.09.06.27.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 06:27:19 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5f68e2e1749so25108987b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jan 2024 06:27:19 -0800 (PST)
X-Received: by 2002:a25:414c:0:b0:dbe:d374:75a7 with SMTP id
 o73-20020a25414c000000b00dbed37475a7mr2374147yba.123.1704810438889; Tue, 09
 Jan 2024 06:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108093221.1477020-1-daniel@0x0f.com> <20240108093221.1477020-3-daniel@0x0f.com>
 <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com> <CAFr9PXn9wqbxToGDkSenW3XTCMPinUg1a9fHrUDQVhRKC6s5TA@mail.gmail.com>
In-Reply-To: <CAFr9PXn9wqbxToGDkSenW3XTCMPinUg1a9fHrUDQVhRKC6s5TA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jan 2024 15:27:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYqojGdKaCkY63mOhxupZ3Ag5+Y-haZZf43wyuCsdKkg@mail.gmail.com>
Message-ID: <CAMuHMdVYqojGdKaCkY63mOhxupZ3Ag5+Y-haZZf43wyuCsdKkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: Fix interrupt stack frames for 68000
To: Daniel Palmer <daniel@0x0f.com>
Cc: gerg@linux-m68k.org, fthain@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, Jan 9, 2024 at 3:10=E2=80=AFPM Daniel Palmer <daniel@0x0f.com> wrot=
e:
> On Mon, 8 Jan 2024 at 18:56, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > I think it would be better to use the classic m68k stack frame.
> > That would pave the way for building a single nommu kernel for
> > MC680[012346]0 that runs on e.g. any Amiga.
> > MC68000 and Coldfire are incompatible anyway.
>
> While looking at how to do this I realised that the addql #2,%sp in
> RESTORE_ALL in entry.h will now break the stack frames for those fancy
> 68010+ users.
> So that needs to be #ifdef'd to make it only compile for 68000. I saw
> an error email from the next build stuff so I guess the change has
> been queued somewhere? If so I should send a fix..

AFAIK it hasn't been applied yet.  These days the bots also test
patches from mailing lists...

> I'm not sure how to actually make that generic without patching the
> code at runtime (remove the 68000 specific bit, reserve enough extra
> space to rewrite the code..) but it's a macro so not so simple.

Or use different entry points depending on CPU type?

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
