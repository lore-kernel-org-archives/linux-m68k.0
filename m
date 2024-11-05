Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7E1D89F1
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816493; cv=none; b=DJY2RJXrtbuoTcSbl13L28JRxuJILVOQSxAPE297WVPLWwpNYhWwKYg2gWSBBOqBglwmSrfs9zsqiM0B0UNx1pAHJP3iAEltAR2q9IsW/JTczzFl8ecQcDRNHd+ES5x/rxWvbjj/Ai0wDl5PVuw5nue9wYOUV8O0kaPhdDhvL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816493; c=relaxed/simple;
	bh=HnchU3TAxMiEnb4LqA1IIZSHQ3nPshfnOq2ODMOQWR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAPAT70NZ+EnLVy5wMQCDvmQ1mDbjc8tVNe3doiQ0CdqLjNLJKmW5QJKe/q2t0TePmBMP+6C3ShHQ0hUbJWd2ZZaHhPSqBsP1cizT9An7WMp/twy0h7+i1BnxjnMOB6Jxmtxxz04mX75NC/ynJTDY0oQ9yQSoGEzGwsIsWWJqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e291f1d659aso4964664276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730816490; x=1731421290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQTogThULkTABxgO4qxQ15BGSdteC82xf8/FCwRDyos=;
        b=oTrEB/jk1QP60xhqYOqx8fK7t+akw6bmwgSGUNQ8nX6RGWNILu6ZT6mGbvNxhjdJoB
         EsdZTiuY/2CLEK5GmzvB67cjTuBywNpcyltv7xgU+J2gKeIWs74qHKTn0aj5tI/mBEAN
         ogJrLPjIkMlNWQ6z/9DrdpBKSLL3eF58CC/vXFKvHauPcIweIi+0lPAn5wCb9gmrY/Sg
         wob3HZIsZwRRfqO76KEjxA21OVfbUHi1WPCchKgjkT4+aFahSZIbiBsonlt9jYvirgl1
         nkJ8+JeElDdtgAK8UEIQPyKHJHkesjB8G00jfNny1bKXyKOHgaz7XlO0cmQclLzZcMkD
         aeNg==
X-Forwarded-Encrypted: i=1; AJvYcCXSypcRTGYIBJqqSdinS7lr4lDjhbJf1C4XlqYwnX0r1PDCaxdZBgMBxZob4rpG326uwENaT2+YOeaJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy5/keL5qMDwyWU4kEwsBbOU9RZEyS4ceavTA2jJlSiz0Tgrxal
	cKHZTgLhhlem3tp9qu4n9LSkPd5VPjMDCRRPJVIRaseRto7iEcw/DEYI6534
X-Google-Smtp-Source: AGHT+IGTNZw4vRh7csiKBPvBi7SxK/u83bboRKXjLgknI5JZHKB2dMq/rmK1BI5S7aQ3lpcohn+TQw==
X-Received: by 2002:a05:6902:228f:b0:e30:dd3d:d9dc with SMTP id 3f1490d57ef6-e330256846emr13774177276.13.1730816490299;
        Tue, 05 Nov 2024 06:21:30 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8acda8fsm2512429276.46.2024.11.05.06.21.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:21:29 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e41bd08bso57681167b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBe6vFtDMU6l6pZsj11mgQsElGV7JuXxjvSD7wyapX38QS/8lNA97iQfIMHGtWO68d3TDTvbD6eU2i@lists.linux-m68k.org
X-Received: by 2002:a05:690c:d1c:b0:6dd:c474:9cd8 with SMTP id
 00721157ae682-6ea64af0eecmr155730677b3.18.1730816488050; Tue, 05 Nov 2024
 06:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 15:21:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8_RL9y3o24_jhPJuYb+5RP+PpBKbD7Ndn9fg7EYH_Hw@mail.gmail.com>
Message-ID: <CAMuHMdU8_RL9y3o24_jhPJuYb+5RP+PpBKbD7Ndn9fg7EYH_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:55=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.

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
