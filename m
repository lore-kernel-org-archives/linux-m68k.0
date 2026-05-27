Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84829898F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887852; cv=none; b=PiJlGi0L6pPOeMxAvQYffM6rnBHCZC/8Ctgy5aHr1XZ+0a3Mhp2IJIFSRsMEpDo6r/Hy7SGPcGtNMq4dUopX1eej87tVOXjUCsYFyKMjyHBltaZ/Jnz4w3r+4xngKCUjpoM6fqUESMtlA8FBksbdFJ0S2hpho5/WZI0O3TEl41w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887852; c=relaxed/simple;
	bh=81bZPJ37mn7A1nrBTaGVCfLUM4t8SEKkTzKdMLIZgMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAjMeBbqFAXspZ4RQ9/T4LZ1MHAwUk7uvL4cSyAUQLChrlOCMKhwk8kOXdK2K2jNyE+5xGH59nPneFlmro/QOowBUuQQ83dsX7FczRogWP8R5PwChiM7S7hJzu82roE37YGq2yiPlZX1QmyNb1551IEIEbb2Pr/ZnXM3stD0rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so1316419241.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887849; x=1780492649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRCmfpq1b4R+1qcl85pdAn5PhWzGoG97LYi2GdYmC1E=;
        b=bc8ut/ULShuLcJCBXmPiIHGQkwoq5TEDkmnWscIQ5o+g2xZDXlwo+ODU5U8DQkvXd8
         +Cw2dfAE+ATiPSoj+p/LKDAwQx0ZMt4RxE2HQHsljrGj8xxZE8N5EhiU0VgT8IKRzI9h
         dYJo//Lt+Yw/tzf+BgBptzN0ZegRH7Rr5ISE17fQ+YoV2Rv4M1Gk5g9f70E+wOOONQfK
         fL0mcl8urqL3uc+qWWEYfiGsU9hnq2Lj7/n3ErOH+Ptwib5cVvBb8cMIf8xbR3aH9jN1
         aJc0k3loCGMrClWdV4l2GdMTZ1CPcfBEgKPP8iC2ywvRWiIEZ71n6MgK9s/wkzVhwE+T
         fYqw==
X-Forwarded-Encrypted: i=1; AFNElJ9E/Dy5D7wdoyJbbdBzMJkBhBdti9Gb7f5gUeWT1Y6FDIDm1roD0VNKAcRC0LBVK8DW31UDDhv3Df01@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxpro6pRVr3UniFTHxFx3B+TEN+NFZIS+BwfdfhIXcy7I4kq+lW
	ejRQ/ReNpKcK/XFTi6PgsOvmNMPaeWY54hugGsQqSIHT02Es7LJnP+/WMqQljfPDHus=
X-Gm-Gg: Acq92OHw1+/PX4Xtw5NH/DGCRHp2GQpsn3lgQjwQqkAega37b/Zq+Z1QeknpJ6c0VHT
	D3q6ub02xCAgqnWsr54O4BP83oYToTKJw3RccFQtAna87kQwmqrnDDt2geJ8hdrvARit0CFjam+
	Pz11B2hc6UeaCbtXjhLLTWN7JMVH8LbVYEuV/0BESplwqSnK6ipvIVxbnOxaxgC3Y7ErNKL9/tA
	A5TojOSIGM+enE8/WTlRdvPVbleQ94rHWYbHSu9LOznYVoD+dqcomClpPXq4aWVn8t0mmEs9mx6
	OH0CJ3stNxMu2jsEXQJIskGPR/VutUrw2Q3SfjKL95LcRkhseh56DsjNwPPlTfSD47rBYBrtq8x
	qtGjK4Io8774FcSWtAm3oEQE+iYE98t0YC8MHCVCCY6QVl2SCcTWUdPsDzkIaC/a5aZSYc0qFqu
	U3vIVJSLs5ufZoXCA9+cMphEr5jHLZ2P7NrSsi8XCLC+lrIDBYfU08MCdb2LTe
X-Received: by 2002:a05:6102:2c13:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-67c84613275mr9879968137.23.1779887849260;
        Wed, 27 May 2026 06:17:29 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm16826870241.2.2026.05.27.06.17.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:17:28 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso3238154241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+I/2DCp8T8Y8xDpJS8mD6Wu/6o2oP5p0dD93OUTOzrC/9+yFBDGO+Tn/NUVM1q3K30wQxZASIVhxUj@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3ec6:b0:631:4580:6a3f with SMTP id
 ada2fe7eead31-67c767cb843mr10676067137.7.1779887848413; Wed, 27 May 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <12911d2a1dfc4e482bbc0a417df73748283d04ee.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <12911d2a1dfc4e482bbc0a417df73748283d04ee.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:17:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZZi9MVEnS1VjugLCY-18Rxq9FcrtzR7x3=MdbcmTiHg@mail.gmail.com>
X-Gm-Features: AVHnY4IGd02q56r2qfPhmxXv4tp6c-mV5aR4QFnr15yhVjYq6uruWZtcFagWHm4
Message-ID: <CAMuHMdXZZi9MVEnS1VjugLCY-18Rxq9FcrtzR7x3=MdbcmTiHg@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] video: fm2fb: Use named initializer for
 zorro_device_id array
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Using named initializers is more explicit and thus easier to parse for a
> human.
>
> While touching this array, drop the explicit zero from the list terminato=
r.
>
> This change doesn't introduce changes to the compiled zorro_device_id
> array.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

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
