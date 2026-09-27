Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0853A1687
	for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512820; cv=none; b=gjT271PREZnMdRlkrKEJZyxrnKtjgoCRqEhVkq1Ol6yObM8lJsCxtnNUQSLOrxvudlPds3PoeyXo112pw9TJssDoeRYOJ2eFgh3ccuD/4mEIackPpjCQXmBM6rtwJXrw9J1FaFIVtpaMAXI8xGfGLgero631AAZTHG0NCe3wsJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512820; c=relaxed/simple;
	bh=7VwhVfArbFHqppULMJ/c2+9BlkyqLEuIgOQ6CFZVsQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+ugLmHaLNsABKwabpboZlQxIJELAbZIkYSXAS51x3COrtY9W1dFAm8fPQE/TlPelk4EeBjDojroohtL9hyA6rI69ftZDCCRZ9/OtGX7D9LbypRuFfLUOnQMFBYnAOclCKOeNa67y3NoSd6nvjCx6OVlGMgym4b1YkguKYGh0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1003288137.3
        for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 05:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512818; x=1791117618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5dI9mpiEPC/crqbmdtswFSRfgC4/C8MFTWjRkq6RQE=;
        b=hHAbZ9Pe5XFnLCaR1Kw2B/Crx6ogV+hzfJKUOL7mJYiCOJ2oG/bco8PXOttuizGbWh
         OcJIiioACDh8lqW2ZLS0yseGKNRfZdQXPPfuiOUaNU1BF9r59a41hiy0UjpU4v4Oxm73
         KrePHVsqkuu7DkXidD9dyGVcnFM39diODAyqM9l5lNmwimWudMZywuxsaefF32FW3jnF
         jjpTqOjJePOfah4ud2WUhltaSVt+IJl77QbBBeKIjfpH3MCOfQILoE3lfRJxQJhG2fMt
         +e/Hz0Qd5TVc8mnI04iMUbPMMfKrc579I4TnavbwZ+0m7zqh0p7ZPl8WLb5jMlDiUIPU
         RTwA==
X-Gm-Message-State: AFq9FYJRAfTBrGGgbXbmpIdw7YQjcqjPbO4bxKDmLNg2XaAMTrbl50sY
	v8SUXz3Ub0V+eYC3Xs4MysIMWA1QadWjDFiaX2UO2FIssHbFHhyjUXeM08b1s7oV
X-Gm-Gg: AYBFou2rXzm4fTtqKmZoFoOBPoUYJMfsEE2JsyWrNPMAwhegOaQs7uRS1ptFYcRC1WN
	DYxrRH22/u3Ghlnu5eSaLsR297bj+qQJp84NAQC2lhQWbb+/2yCz9Esvu7gZ6P0vE9dsikTucXA
	HC2xFHoVmGOCY8baddmPqtDIlAtf3vXM6xsCew3nidQTx3MlgUnoY9E2EHMAoi+9TPV1uZq7u6e
	AV5UIk7bqX9AEwsLbjnccTD3pRgP+3ApLOSAkQvdsvPlpKKCI+9ACUMUuKudNmtcnyC37jZFz9q
	7+LWAE2Ecfb7parJhpDpOI3TV1P6ckJnGTBhpGHAt4Cb12XdfXMkXiWrN2MvIyIx/m5U7wXYS9i
	mRvvSRauVBcvj5dpt3hJysroE3BPaaXs0ZhM8Fk20BZTOuKnA0pfsdj1+UUNKE7mGdROH3QEOLG
	ShMrxywmDYdSIfuZqZYwwzfbFhtfiyRZwUlWu0mAk6WamBiZqPi7j07/d3f3+LGZ1KjdWGtzZ19
	vv0UVfdBGqQPW1hZt1V//6XBzzHLXJEW1uS
X-Received: by 2002:a05:6102:5707:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7af1e4f2ae5mr4094234137.22.1790512817941;
        Sun, 27 Sep 2026 05:40:17 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39bcb1f14sm5288050137.10.2026.09.27.05.40.17
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:40:17 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so517347137.1
        for <linux-m68k@vger.kernel.org>; Sun, 27 Sep 2026 05:40:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr4356884137.0.1790512817154; Sun, 27 Sep 2026
 05:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819222838.21256-1-schmitzmic@gmail.com> <20260819222838.21256-6-schmitzmic@gmail.com>
In-Reply-To: <20260819222838.21256-6-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:40:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-X=dPMDd1Be=p-NpjKJVwJybRknFkGcm4BXpYJaQzrw@mail.gmail.com>
X-Gm-Features: AclHuK9luG9_pDvpN1isX4E9WKE_aOZ4oLyQn1QSkm9ztYEI_bvC9P7vxCemxn4
Message-ID: <CAMuHMdU-X=dPMDd1Be=p-NpjKJVwJybRknFkGcm4BXpYJaQzrw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] m68k: Add support for Svethlana
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 00:29, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> The SuperVidel FPGA contains an OpenCore ethernet package. Add
> platform device data and other necessary definitions to support
> this device on Atari.
>
> The ethoc module must be enabled separately by the user.
>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> ---
> Changes in v2:
>
> - fix svethlana platform register error handling (Geert)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
