Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267DA3D5244
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887968; cv=none; b=qc+PkjY88aVGbgxCI4jQ8771K9+1Gam+I/eyOl27D+6uaYVSIcKf5So/NZvSJKa0RsL7RLNtoGw1YE0T96J9b0qveU5LTPHU0e7KylbvAjEjmdnIPsHn7QK2zs7f6UZVsFcBRPebwvxZZJKy5VXGgfVZoBrWjt44zoa5LxRLcwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887968; c=relaxed/simple;
	bh=AjcxmWiZs/W0/FpmxYHeRwNhXSwMVZOVC6Quw854Sa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOfc/VYA4xcWrnp3dx90rbCsT0AOjxrxfUQ/uZFg6jTUAu1MjF/3bhQIDYIbhLz5drgNd7ByGR57FpWaQcXn0BtTzfjBXH94FnVXk8Q97BgAQ0hW3UkKHwEJX3PWWybFHXopMmLGi08w4sxNCFBZFddOW/8EkbEQCXmuZ0CUBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751e12c524so4072329e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887966; x=1780492766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xf1qQW/A1NhAIluH/eTEZ9k/rUaYP7h9UU5do+wCVRw=;
        b=YA8nHPfQP8cBZFnUgmUI0bP5pyNSSaYkL+/bQHm/ceIJe1EP2m+uq87pKw8SBJt1DF
         t4AJ5tVPSHf356pR4lGgW3CfA5vUv31KwVmZsw8hKTii3J9Rl63Z56sT8CwrKXWrF4dc
         dIYiZxJA+ieVXSy1pkiV3TrYlvh+sjwQqN3LihtBL2O5oIoPZ/Qo1zCYOPxu+XL0kidC
         rdEvONpwHDfbdiWMdBt6zgKnS9H+QC86Lf2osOcsRYlYh6FVnsgLhmBX3EVb9a/dPpno
         M7ugpTflw5MKtrGXwuPqqoPp+4gggD7AXlM5fj8fiUWjilWkqId8BcBwXLCP36qMJLqO
         0j2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9/9BZxodyrrYoQx+3pXMkiB6fq6vQnyJRhA39Kt1T775O9qcbY8l9c7521z9w8RZuhtBQCMXvPsxwb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyjGMGsMWc2oWtpPdRbcnZB3ri15hmHHtbp3GEDdjxaE2ae2e3t
	/92mdx/ZmCngmG+8jeuC0AkSPlpMVKFtTd0Z30aSVp4BfJ10FVs9tX49Tjuvq970Z3U=
X-Gm-Gg: Acq92OHn+w2a8jRsei1UM02ji61PxdKvqh+j+aqT3M1GkbivNAOX9LQenJQuaJqFhU2
	EEZZ3Op8+oTZ/v9FeDFNw9a/5TyJn/Wis0iN9fYSo4Sn5u163ffDm8NZyGnov34KDcXjBSNosbF
	a7Ie3YPn0xMvMpN70Uu9N/XLWDZ1gLQvuAuCQTPiiDUJ9SDr9DAlSxIvPh+ErXAyN3Cvk1S6Zl2
	NOtRTR7FOHVOyUPu2QPlb52Dvu5IsW5MFv+ff+3hx5d43uUU6s0ImkVrwKLnWUw9xKewKRCdZ/G
	k/NGLZwZjdkZzom1Jxd5GJWGUVt5Y681TwwXhWD/7PGZmh8fs0EVp0vNsUCmH86mu2MSbxiRXNx
	wqIi8jhMnRrHzN9TvchxP612kA76jxAwP1snMaGh4XnaRIIjqFpmE5Ml5RbnaXw4C9SCef6diZN
	TzUZBgLnsYxu8jeD6XZilp3bmL34Cmx++dxn7npTg0GqaEGWO+xWNKEwZlHLkZnrkiQ8fUDdY=
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5865e2b5250mr12334362e0c.4.1779887966074;
        Wed, 27 May 2026 06:19:26 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f973300dsm20402861e0c.18.2026.05.27.06.19.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:19:25 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-956948531a1so3115488241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:19:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XA11L9w82Ln37ev7xzAnTwyVgqAIx55tcds1mmmfq8p2JCo5V8zRL/P3qE7a9gFBRV2n1L7oIt+7u@lists.linux-m68k.org
X-Received: by 2002:a05:6122:f07:b0:575:38d3:7c8a with SMTP id
 71dfb90a1353d-5865d70cb74mr13246575e0c.2.1779887965533; Wed, 27 May 2026
 06:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <72b515651ab8df2f464deb620fd7b24370d6fb1a.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72b515651ab8df2f464deb620fd7b24370d6fb1a.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCzFTmVh_5PSEW-ypoq6-aARO9E3OhK7SJiW7mM-DA3A@mail.gmail.com>
X-Gm-Features: AVHnY4LOsqJJ79rG73uUyFxUiXTE8CyABHxaadTKIcLNCLm8pGmOMdJ12-1AfsE
Message-ID: <CAMuHMdUCzFTmVh_5PSEW-ypoq6-aARO9E3OhK7SJiW7mM-DA3A@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] video: cirrusfb: Make use of struct zorro_device_id::driver_data_ptr
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Usage of .driver_data_ptr allows to drop several casts and so make the
> driver a bit more type safe.
>
> While touching the zorro_device_id array, drop an unneeded explicit zero
> in the list terminator.
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
