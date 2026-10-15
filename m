Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2C52269E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069627; cv=none; b=KwNpXpX+VhOQUtatAVfag79xvCZhUS5brW6HrEx1uSvVqUImb3UTVD7hOX1DFW1LzLb0K5Zf95b4PSmCBQSuYUK+etPTebHpOIKQb7gAqqy0U3wAjXtbdwZklkUwxTo9skN+6WjDlTmRTtr7DXhZFr739fjM6DvEWfFmNx25YGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069627; c=relaxed/simple;
	bh=fttiZBNkYD6sTLyS2zJ73b2MnknfJszx/6K5lwFPaaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKRtn21JkRUcjGJYM1Rsfx7IGLA61ke7yk09rM5/JHPXUyLFOSkB+8Iie2rTDg4h5RB6YhJ9bdxScXJPhyXa9/xm/itLSEVf06gz4KyYSWGkYo5v+KtmCViOKQALFUggvdeXz4tuXxw7K18M7noE6Qt9wBAgmjcV9T1DFayFSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5dc2dc6d3fdso1930260e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 06:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069624; x=1792674424;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSztrjFXDe2HY45Azvb46Y0IflWP3zkhLimwwlwMXh4=;
        b=Sf70Q88JQJVD3R+Nd0VOryBE+KJsnZmYlV4Fza1XpsrQIep2GxIo3QhV4dYAG4ZWH6
         /vHxO6X+DRdKKM9iaPTpKAh1CQY3ollUPqTNnde/BsreQwGfrhQ4JTiXZY045khiM3Yv
         szPEsRSXfI63kITp4OYhZ/T8ipdindU9brhtwwTu2NTAHFNnwc6dOeXBwhyTLYvPPFvx
         pbaRvQPiGOL1Q2uQoNhG9mgwUWWV9C2a0K292MqzY8BVyi/N0QGCPpPzIUT0pgFLmtcr
         8Xoe2WwdFAc8dHKabyqVtcSqtuRlGXC1XCLd465a/syNm+1/KvCcxKm3Uk5G97ONslgs
         qNNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV/529sjcors34wMedDWykuExnHJ35V4wlIxJpmOxt7RxQm/jIbe87UJYrl3mF/OJYphG6ZcHGIALN@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJwSHo7zgt0VvImrLNQzL41pN32NSUxsVr++WCzv53hzGza+7UK
	ZX/rSZszqfbm4wRzT6vZZE1IzBmREX9JpdXILh71Uzdpboow4bDSiKxXeHe3CJmKYuo=
X-Gm-Gg: AYBFou0WG/qun9t5k7dsV/bP6BN8jo7mQu3/xJj+Y5eiUrw9MneBUOWa+IiO63bLDvX
	BEPPLMeFXAA37fOlLtaW1N1z6EGfFM/VZxaoxwMh4znQmCaZA4UNGV4PcnXzLHZh4ZcN4oBwfgw
	boHZtvtABKEC8cQ9YqoAgxKKWtLoFtv/SzRg4ZS/qZ0O+tZOje00JkFBZSgu2sN4trzya2dwZ6T
	abu+H7i9a+vEvSi0xhOyZYieYHMQA36BRWC7XSl2LUrKm6eA1BSuj/J7iFSLcgFEN1EhceNp+yW
	jZrmr2KA0rdbXVG84/wbfSlnK4jjYVvIW63kRAycYCi91HrPHqyPUBp7loQmlHqd6q84ePDE+jL
	Q8BXJTizvE8nBk+Ln526yybrcJJz6coqE9YuYSr7b/0AeQwEIaWgrzwVwvZEUwPtkdrFH3Vhu7J
	9NcK3Oj0mSyvc5P1PCizWLHoJ4tzvURpiCFeV0ELpNU8BbiUBclgofZRQLNQtbclvUauLFf28sJ
	skk4lTBNcgpCJTj1qlSGK3ppmrMc0x8N0+6Vhak9ApV0n4=
X-Received: by 2002:a05:6122:ca5:b0:5e3:828a:267d with SMTP id 71dfb90a1353d-5e91f518042mr6297595e0c.15.1792069623564;
        Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f8c0edsm12354169241.11.2026.10.15.06.07.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso97567241.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 06:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXJwG/OOGCZk4dnL2xKUyTpQgqSZSbp3edw6NVR2G1j9nQfBKTMG2MpryUzRU/ID6KbIx29xvFZ3dL@lists.linux-m68k.org
X-Received: by 2002:a05:6122:218f:b0:5d9:82c1:b343 with SMTP id
 71dfb90a1353d-5e91f250d84mr6152791e0c.1.1792069622761; Thu, 15 Oct 2026
 06:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013120831.1046590-1-gerg@linux-m68k.org> <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll> <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
 <20261015-adamant-realistic-bettong-a24c4f@quoll> <4e9b365b-7c5a-44f4-bfaf-d24e9162fd94@linux-m68k.org>
In-Reply-To: <4e9b365b-7c5a-44f4-bfaf-d24e9162fd94@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 15:06:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
X-Gm-Features: AclHuK-L4YrCSikdmKp4uyJvcLx1JbdRSylRALstebroE1ucg4vSZgEb4WIoJHw
Message-ID: <CAMuHMdW84xXV=msd7Sc3BY+50e-gxFxc5dKL7anhrU893NFVaw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 15 Oct 2026 at 14:53, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 15/10/26 18:56, Krzysztof Kozlowski wrote:
> > But as proven already on the lists, no it WAS NOT tested. You have clear
> > a warning.
> >
> > Otherwise you claim that tests shown errors and then you decided to
> > still send it with errors, so then th enext question: why do you send
> > code which your tests tell it is wrong?
>
> Sorry, I have no idea what you are talking about.
>
> This series of 5 patches was tested before sending, on multiple targets
> that use this code (obviously all m68k/ColdFire platforms).
>
> Just in case I missed something I re-ran testing with a fresh 7.3-rc7
> code base. All 5 patches applied cleanly, with a clean compile. My testing
> showed no new problems in normal operation. Granted sashkio did find a
> couple of error case checking issues that you just do not normally encounter
> in practice (but I will of course fix those for v2).

make dt_binding_check dtbs_check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
