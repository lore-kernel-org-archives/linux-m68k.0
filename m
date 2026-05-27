Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206630C171
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887716; cv=none; b=YjERgM94DgalDs6042qJ2cPy7E24H2J1AaHgSeyARJ7Dib0o8efmC5Wn/yaNW4WFnRJrwXoUyuwPJ5rLeS162iRXrz6Ram5lNmn1cidpG6gIGMFGXtFPqi86xMwHcCht8lUfyV3sBbdutrirvFN7g+eQNzmra48+SCgEW4HlqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887716; c=relaxed/simple;
	bh=NuNvxIHEMMpLcTwcLN317lzyiSS9qhMROyeREEechDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaWL5M9o9Nc720XkioguNCDa11sfvtj09gs3L3DQYIhciFdbzTYoJtXb+OjrIrJt4xtWdL/yUu0MGWkOauv2kDzSHUjNEMqeH7t8oo7+DI3mMx0nHzR5o5D00rMxHdOMTMwGkthQbk8E7ovKtgFaO03nGgKt7KrPRagfYvRg9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5945b781ddfso564216e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887714; x=1780492514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJbyg3CmiTY5UdW1iNZoeveCs0jnc1uKWTBV/g2Zt+o=;
        b=MvouX7dJBQ53lwLPoChBOVCSYHxihCyoVXSb/Yc3Knfq+EdjJSaIxsA+fT89GcDYLE
         rqpWbnpdLzMBnVV8oFyJ29wiofAbYjg8XydqstyCBK0MVHpst+EYYXk0+mYxWjCn3+E9
         HKVaG/PGHanSs96vUyay5cLll29isO+8tXpzqzTOEeYHCTjT9+9mK64Cz/a5UZVMIjBj
         wzClklsOCuKsm+GL5wU4E4wBxFrcJbeLrIUn7xNiZ/TZ/EAuZK414Y0nlVYhaZ6BTNNm
         BXNOTgHk2UdwjWaeeDdLtNrr9Z0w5yRI+j+De9SHNkIatwVib4Cxo8CkRruEYx0N8o4z
         4XKg==
X-Forwarded-Encrypted: i=1; AFNElJ9ryeTIyPI+U6/k5WBG7ZyNVkiRVj4IoG+SwZYMvaBydB8X0mSsQFkJp2daGUqj0PrkWpLeaUU6kPcW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy4MJnE8lVn5yBWeX9/VBrbcpdOw6dJy1te3ArGdlcX1ya/hIyJ
	tKJwalsTnzk0PgNTNsdQQwRyvlAAcUxZ8xAm5wSTymjT4uB3Il36HgtpC4J7QvUM1DM=
X-Gm-Gg: Acq92OEyhrtsZnDqvQRYwL4xizweUNVUtN69V7pcoMXj7NKNoBJsy/qIIo954547pp0
	Vq/8Wf/Ekw1NoDAJE7BmCjQWXNQKgRonSCbFbZ6uHdyt7mCYNlcewd9q3n57oKcBwVJ1RMFy+OH
	zS0ssJTb8vR7YMMxf3Lpj8KL4F1CIzgVMVYTHbUPmqesncBTSWGkshWX3sdTk3fHr4vFQHr8G95
	ozMdEuIwrePki0v8I2+OreKaVKZLXYwRpTKFKwowZx/tue6M7miU/F0jksvrM0draZycztRW5lE
	H/OSClmiejAwf7JmYWDFg2llliuWu6ywbLXsxAI7SZmKBEr+ticNVQbLwdyB2V5e50DddiB55RO
	hu8Uv2i0EsX5Q4vj+x3XuJM9nw4m0TqvDMjKQL8x32WOB2mUA6dZEOpXjCEJWyL30KsVxjhNA1y
	wRNIiBOXHth85Z/7cbiMsF8kiTWJoq64h5XYE6ja+Ygmle/DHQ5nDcXjLYo4xsKjSJ52GxZNE=
X-Received: by 2002:a05:6122:ec9:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-5868f88e6cemr9974278e0c.7.1779887713430;
        Wed, 27 May 2026 06:15:13 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f70esm19929063e0c.10.2026.05.27.06.15.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:15:13 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-636970cf66cso8992737137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9HXwXc6Qp3PJZ/cTLlUKxLEOM+9dkGrX8NS+uFXADBtcZGDWPrDNo5W8TeKvSmZgu1O0Qll3q2TRj@lists.linux-m68k.org
X-Received: by 2002:a67:e905:0:b0:6b1:c09:4202 with SMTP id
 ada2fe7eead31-6b10c094452mr280240137.5.1779887712838; Wed, 27 May 2026
 06:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <a20f52aeee9dfcacfaea43ff280fa1867878cbbe.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <a20f52aeee9dfcacfaea43ff280fa1867878cbbe.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:15:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJpPZ2DhrUE7cpF20Dg2+wWqXRL4D6cfDca8XLQegOVw@mail.gmail.com>
X-Gm-Features: AVHnY4JNlHO3xU2ToNfirnyHdNDRJnjKIw-cP8vUt0A5y3NPzppIp4JL0RDJSno
Message-ID: <CAMuHMdWJpPZ2DhrUE7cpF20Dg2+wWqXRL4D6cfDca8XLQegOVw@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] ata: pata_budda: Use named initializer for zorro_device_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Using named initializers is more explicit and thus easier to parse for a
> human.
>
> It's also more robust to changes in the struct definition. This robustnes=
s
> is relevant for a planned change to struct zorro_device_id that replaces
> .driver_data by an anonymous union.
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
