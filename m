Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC03F6601
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887802; cv=none; b=o3ll0EJTeso95d6qdKW/djMnW8yjc4R6OKXSyUsCpVGorAldsFej2Qlzo7vC9EdIz9shFOxRylHODp2k4mPKbpkgjki/iiVmgmH0Nk2NFRedbQ0I8oDGH0luG1n7mXO0sI7h87zU+Gl86foWsa0C4KpG9dapWeAhZQNnJumrov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887802; c=relaxed/simple;
	bh=xJbaIu4kbWT3Fd+qBIP6+uFDK1bAj0KqKpunyne2doM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dru5hR8nQVc6Bd3LXibTaJB5/LHcj9+5/zj0y9gxm2g0yz5HGGP/+N45e2KPW86XB4V5xtI0vc/c/Am/repaYgQC0apl61DD4+JbQ/VYv92Ryqv7cSAzDiyjCIoNY3vm/4zyXTgeHAJypaXzkzHnJn2J4ov/qKT47AwN8H/zpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so1315822241.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887800; x=1780492600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cwyok8xK1yj/Bl5wm5hSFz/m5QSxpKe/GA3lqyTJoOY=;
        b=qA2RNMWqomdijz/wYlWBof8vxuvVrluch8IxuirKVx7bCK7s/Eex3u/iwZFHzYCdyO
         K7turMGW5cIEFlB/qFWHEPW1oBN7apTYh7moMUPOxRPkb+lKa1Z7iGABxMuBE9/QWyCD
         eqtEkE9sUeLc0MfCQyntWtDjEXcElLU5SYr88JUMGLPszuxCZzU7pwc0BZmLwvN3/s6F
         cj3TIW5G/WCYnDW+fC0NaUVebQcmz9uJ3gt4/ytpz2OetBBD1T6+JPKcTtUnwE6rjk2B
         vCo0S+3P1nEeQXAWHO+dwsETew3shvDnP01A+7pSqkPQAxVGaAUAAvEEcoc9M0cHPnTj
         mMYw==
X-Forwarded-Encrypted: i=1; AFNElJ+OhYfvhaiR+cZmMBo5bF7YtZLecrwCetIq4lQdm3nfS2zXv3M4kt6uaKWS0BS6NKpQE5+8Cfm/l2KZ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzE+HxjY1J4VJvg0LWSX+I4SKBhaTdumq5Vo4LhN01zGVOHA9Wz
	1G9EJOTGI1hONgFGj6owU9NPO2/KqR2f9yfG29tTGIgQEFACTzEBlKqMQVH8sW49Lj0=
X-Gm-Gg: Acq92OGhUQXlxcJkDIsiITu5/8YARCDlDw3s/IyrKLkuGmLfX/Lzsnc6jI6C2L603Bs
	tDN96XfTGeIcprKuHzxVWOZiON97kAKmInKKgnVh6W4S8b2CKsx2nS+fgRvPTW09JkM92ndPZdw
	08izMf6Ogq2e9n/DO1dt/GDV5+6wCt00hw2NTLHeP6/fsGGXL829neVBAhRHNwyr61sFnqsq+NC
	HtzIiFmJ6OC3F8GcXco9ANrZBGmQnv/lAd+2FO4WRGiFWia02KdgwPR+lOu6T8+eL1RS4qY4cYv
	GvuHXD/knrvyvvk9YLUoQl/2KNQ0mZLvF4HFPI+jvOvSbNDQmqwtV6IZmDsTY4AzF+Rt+fYPVN2
	36nTzjqY/gn4aYqPSPMw5QPDvVOchBQQ+HDoFnf9m5ODN2bv4VYejsea0aj2/eIsuduKAyuXLU8
	vqWr7P+9HQVNfCPnzs3DXjXbr38snrX3kraoMFgNXalI4X8gzFObwryQ9n5U5rGW2h
X-Received: by 2002:a05:6122:130e:b0:56f:7300:37c9 with SMTP id 71dfb90a1353d-586628bddf5mr10107584e0c.10.1779887796034;
        Wed, 27 May 2026 06:16:36 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f3c003ffsm20210066e0c.8.2026.05.27.06.16.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:16:34 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513733658so3966339e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+04JLFaKWefcd5t+Xa+TNnX8jKYctZ3elI7Slr986fyF87mT9qSqOQyYlZYNAaqL8KS3xyWIkJvAdE@lists.linux-m68k.org
X-Received: by 2002:a05:6122:4f94:b0:575:a6f4:46b4 with SMTP id
 71dfb90a1353d-586628c2881mr12587422e0c.9.1779887793671; Wed, 27 May 2026
 06:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <2243204c0f57f79750de00c072914354d4f65707.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <2243204c0f57f79750de00c072914354d4f65707.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:16:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpn2G5oUVF0r5zKOYXpEFTkdhsgMDVehw-tvYsLhoneA@mail.gmail.com>
X-Gm-Features: AVHnY4LxtxfzOwDFHTzEquNzmA6_xmWByOKk-5QzmexzgJiQPch2ZMC7AIrVBiE
Message-ID: <CAMuHMdUpn2G5oUVF0r5zKOYXpEFTkdhsgMDVehw-tvYsLhoneA@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 3/8] net: Use named initializer for
 zorro_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, netdev@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Using named initializers is more explicit and thus easier to parse for a
> human.
>
> While touching these arrays, drop explicit zeros from the list terminator=
.
>
> This change doesn't introduce changes to the compiled zorro_device_id
> arrays.
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
