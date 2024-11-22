Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C642FC23
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Nov 2024 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286689; cv=none; b=PY1sDb4W1r7D4QyGr/tLUPwqKBM9kjD0LgHOHdi0lD5+Fd8L7eA7eCuFy9Aw6pOR8v5JiHf1lcoGfJJFFp5TSVzyITjTjP9PLKpDW7kxygEVrGRdtkea/51+YQi0mU3ZArl+LjJS1SRAbnHME0fZ0j3zdEl+xct3PEumr23V85g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286689; c=relaxed/simple;
	bh=gJsgUxq0sobbp03x6bMBjDPYFVA94LM0CfgzuKj9OuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpYjfmz4wv8IaQNOz2xnjbS9GNKm7Kd/UCIZCoFzOpqRiaH2lPPmnC3YbeqgNEFXxm9KxmZdaeiVS6VJaPFdo+Kb9qr4hyRJuYG8p4HiGTJNT6n7ESpb3FfDTS+LbF91yQ8BRTsbJgKaA7B7tonIMXSalqUDIhbJzjRzk9wfjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e38b425ce60so1855675276.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Nov 2024 06:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732286686; x=1732891486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TK1UmkxMcUsCVip+ZuBRR4ESoNMHebvhGvPDWiAEw5s=;
        b=YvOFmu/Rm739FbQMcHiRzR1fj2z/qczDwiFOmRyH6F5A/JQoPG3dLUUcehB8MOnDP7
         /hBdfrMSbjbp6TBIgko+6SKV9w6k4b2GihuDvvzRFLjNtmrodyGbYF39jJPjVWfPl8eJ
         CmjAv4Y3vwO0ucC9QZ96eRd/mXLeTQV7FkeqcMK+k3sgaSEHVVS7R7YL7xy4YrtqZAgl
         sFjxDWx7MyHu2fz7qO4dOA3MjZ9Vtxw+to4zmMY1VRCjR6NBKz79PNBFc0HRD9nQTN0m
         SiyW+IDATeyGr69n6KlBe5tBu6iVvGZFYHEEVLKZvRo4gJaclq6hpGD4/gtVbZ4JX2Ns
         GPQg==
X-Forwarded-Encrypted: i=1; AJvYcCUUJzR+PyKv5SdunLAeIbEaO/txWQIT9maAOgFnQx8Bv2zmbnTLESUVHo+qTmQEqtqdhxovLRS3/tSP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwBa7H/+tfeJUS/71sKXJJB+OZq21YgbAchpPYyajBcXCpydEYA
	OOBLHoHMp0i329WiFb3bGCukUry696jx9sZnIqJ9th826Fz8r3yCpmAhTQ67
X-Gm-Gg: ASbGnctXkFI+e1o6ACoe1jjJKAdwkF7dR8e9mWIaRKIsUMh/YLxhZWVOaldc3DxDq8w
	9jzIRpEtxZGrw7voZpxB5e4iUxicZTebWPXxE01hgInakT1LJvNlh0KNRurUHbrPbv1L58InQ+5
	A69OA0uHgDcq9kvn0A6YRbKB/u8AU38LQvDZb+fdOy+uumSGEx7zk8sxqF0WLJS661D74FKcZMj
	0TtCK0vM1buttQgzdhZor8FHblvPxa0P4JT/ziZPejhL8C1795YQG8iLhqZjpJp1QyXUXd0e9Vz
	mpkAWEEmbSSkgeRU
X-Google-Smtp-Source: AGHT+IFND1/FAkI6bDFVFWnZyCNYKtwHo0l0EFNmLSyYl9KuRn8C3oKXq+vTsp3lRxioZKu8Yp6QyA==
X-Received: by 2002:a05:6902:1893:b0:e35:ddad:5ab0 with SMTP id 3f1490d57ef6-e38f722db5dmr2586185276.18.1732286686402;
        Fri, 22 Nov 2024 06:44:46 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f60251d6sm640406276.11.2024.11.22.06.44.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 06:44:45 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6eed41d2b12so15648127b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Nov 2024 06:44:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU56h/7OWLj7k25aTmy6aEh1qVHTXFqaIATpNFP/RJfDaDft6McUG+hoI6Uq+ifr0uPYm8G6VwhzPGi@lists.linux-m68k.org
X-Received: by 2002:a05:690c:688c:b0:6e5:2adf:d584 with SMTP id
 00721157ae682-6eee0a554a0mr23716067b3.14.1732286684959; Fri, 22 Nov 2024
 06:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
In-Reply-To: <19a16bcc94c42ea9c5397b37b1918c2937e3faab.1731450735.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 15:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
Message-ID: <CAMuHMdVuv7wRud4jNt=t4Ac_s4ze6YYguUKLRt0hQ4gTqEWpEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:51=E2=80=AFPM Finn Thain <fthain@linux-m68k.org>=
 wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.
>
> Changed Since v3:
>  - Re-ordered defconfig symbols.
>  - Added reviewed-by tag from arch maintainer.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
so it still can make it into v6.13-rc1 via RTC?

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
