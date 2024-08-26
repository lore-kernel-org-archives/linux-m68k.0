Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C396139CE9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658166; cv=none; b=DOF0NP935PXa7H1nVzKX2y8rnPm5VNaN+aDlEkyPne2185C4I1Ga0XBusIpVUYkpuNSi0pnD/ezBE+NXLbqKfg41K9QB0ohHO1Bdfq1Ft0VprvuBjrWDR1QyzgbXEptV/7TtDU8aTTdUiABfBGdFjUcJwwBoBYLpvFCC8ngMH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658166; c=relaxed/simple;
	bh=gJEOeUJLJeIzTSq4wguNGslEJFWw+xJaOZTfQrdfuDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQQqf/NdpijMTjG0Nm06DFkdRqlS4iYWCwWhKqYfvgaiDQFhwmNoMdi6zf+eYP98gGbaTAj0P1WAPq4n4RrkrVOIbzls6D3XZvHqP+W13e3CC82X7yV6e6Jli32ME0TLfA2/ENZ+TSRRAQN9KBmmK6CrYYmIHAj8IDZz6iwpNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-690aabe2600so35688037b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724658164; x=1725262964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8r11L3gA7W1DQC1zgQUSI+mUJHSNIyLCjbXmmaIRvc=;
        b=q159qOIfsqM1SsYGgtVzGwzaqzfSqwt8aBpi/wHJJMeEyVTc+fxWz/5ZkyOp06D2s5
         0jo91duILrywUjfKYZRDAExhnwVHSYYS5q6AVZq+gEc/iOUUOSev+hIdcUCPtKcJMe9v
         3Q04+F15paEdIEw5KBLBOSgU+764KginovUD9y1LJXaOfVE06OdirjRYHUm407M8E48o
         LIfL4aPG3Yh4rK4sMSfIFuD5rxmZbCyAXuJb418Z19NP5+jOYkJETmE7mtWKewS1lTXQ
         Uq0l5WCXhnt6qpsOYlNt8bNj2H4xSpUytevo21+um0HpQRNCOObPVoeLautWFvcuikjl
         ke6w==
X-Forwarded-Encrypted: i=1; AJvYcCV+xTYa9Do3KeipvSar1IzBFxeX9QJ2YbFaD2osT3jFkGj5vWUkk+NiXAPcndt0XsDnLx6SGu6WqMjE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxj/Sx310DiQvrDPG53wiMfpFrsfu+k8dTr3OGLgGtOFryIVB7s
	Qo52l3CR18CQWSVIJBC0qPnvlQg7tP8R5iCxi/JoaXIWiN2q4IfsBr+g80Ud
X-Google-Smtp-Source: AGHT+IGNyjcdrtI0oTYFMrFXdUYEhZIy1bmr+ukS2s7U1QmZAYdZkBSFTJ+81G774O7tojYkpniReQ==
X-Received: by 2002:a05:690c:288f:b0:6b0:e813:753b with SMTP id 00721157ae682-6c6288aa364mr77670337b3.38.1724658164239;
        Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a84ec6bsm14347857b3.58.2024.08.26.00.42.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b47ff8a59aso32988877b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpc6ddtIxhZmwiPcc4kmIDrB6DLgW5ckS8UYqJuhz/KIAuiyGkzCgQU6QWuqyzAyuI9Cy9XuJi0M6Y@lists.linux-m68k.org
X-Received: by 2002:a05:690c:605:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-6ce868cb3b2mr15209867b3.29.1724658163749; Mon, 26 Aug 2024
 00:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821082101.877438-1-mpe@ellerman.id.au>
In-Reply-To: <20240821082101.877438-1-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 09:42:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRmEewx3XrwJT=5yPRskJpup5Qxu0U7336r_6pJYsMvA@mail.gmail.com>
Message-ID: <CAMuHMdWRmEewx3XrwJT=5yPRskJpup5Qxu0U7336r_6pJYsMvA@mail.gmail.com>
Subject: Re: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 10:21=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
> register_pmu_pm_ops() is only called at init time, via
> device_initcall(), so can be marked __init. The driver can't be built as
> a module.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
