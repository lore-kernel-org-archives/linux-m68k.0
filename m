Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213541BDD1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-680285e7ce8so55259646d6.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 08:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299020; x=1704903820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG6YMET/rAdhYaAa0Ujzpcr2MAAod3ZbBY1wyg426ig=;
        b=rTupJSaBKcyLgokxFfbyxYGvGaJx88OtHiErrnsYWvSTy8bKfarmSSitNiQX5RYJfA
         GPw5KPGfHbFqwYia1/Gy70GWpQHBcdIxwG/G+O8mGVxYYChyBcnbZT6lNfhg9SbHR4pZ
         PSYdVF40dtGFQFDMSMnPuOGlZ/x35465P7qp5/zJbnw/aofTHpb6j7u8cDdo06wDPX0P
         ZM2YkK2bhsUsiJcnQURMPIASabeMRu/JmJVGxCR2m0uH5SOG/aQbfbI14QIK0HOS2814
         hXtH0DDSy9SFl4Bm2SQ1TMs2sCPrU+t4o5e1fIVPpzRptMsixViFevJaqzfLPmIZgZIE
         q4Gg==
X-Gm-Message-State: AOJu0YwSgPaS8W++zgoQNdlD/MOWYweyXDXHYaOKISRtDZ9Qpcn/DBFV
	cF5FvhFyufQPqxLolP7Fd08laLd4Zc49BYPk
X-Google-Smtp-Source: AGHT+IEwzC7HRvOmXcUx65tSvC1Kb62G8rhokz7UWDoqqgh5x2bbdXjBYTHyB9eCMp4e1/vkK7H1ZQ==
X-Received: by 2002:a5b:148:0:b0:dbe:5e91:13f4 with SMTP id c8-20020a5b0148000000b00dbe5e9113f4mr1762673ybp.22.1704183395021;
        Tue, 02 Jan 2024 00:16:35 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id l21-20020a25b315000000b00dbccc57e9c8sm9991865ybj.56.2024.01.02.00.16.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 00:16:34 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5edf3780534so40064357b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jan 2024 00:16:34 -0800 (PST)
X-Received: by 2002:a81:df0a:0:b0:5e8:c696:a756 with SMTP id
 c10-20020a81df0a000000b005e8c696a756mr10641455ywn.102.1704183394483; Tue, 02
 Jan 2024 00:16:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2023121940-enlarged-editor-c9a8@gregkh>
In-Reply-To: <2023121940-enlarged-editor-c9a8@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2024 09:16:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHnfwcdXrD6JrcdfxEop1oeMyN3hrvf+iEJQi-xM7pmw@mail.gmail.com>
Message-ID: <CAMuHMdWHnfwcdXrD6JrcdfxEop1oeMyN3hrvf+iEJQi-xM7pmw@mail.gmail.com>
Subject: Re: [PATCH] nubus: make nubus_bus_type static and constant
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: fthain@linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 4:48=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the nubus_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> It's also never used outside of drivers/nubus/bus.c so make it static
> and don't export it as no one is using it.
>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.8 branch.

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
