Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F03152532
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Oct 2024 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379174; cv=none; b=rSSSYOd9cbDbHyfdUke2ISw2nMkX8V0bPkAiGUKEU2TEMlouT+ntxrkSaWjcFVBBbMfk8yT2lSTHm9dvNI4KBFulM8pENTyp7s64JdX8TncNOS/N4+dKoaP/jOphoM/uzXIPk867/6LjpXMBTxUGMRi+V/tihPduWuadijyDOCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379174; c=relaxed/simple;
	bh=mniWzRf/z6PzV05XjmEwI0uQV6qrURP9GRSSBTFcSHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQgyiegdafaOnMCtrUNUQC5sdN/t8kj3xBc0czlXyoePn9s8bCMm7TA3uwGDOObYt5XnfmqG75pkXCHj7a8xjSJWeDfx/4Ay0XucFD3Z5Xal9X2mDaE71AX+8+24fspYWt7Jfiu4QBcg9fgDC2CurzZc73Ynv/TYQ/diKW6FoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dbc9a60480so45502527b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Oct 2024 02:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379171; x=1728983971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McrFJhWoFLthcX2r06lwIZtP2OwgtLED+X1B93Ic3E0=;
        b=mrSkB/hcqnUprBYQGvMlocYwdW1gFspP0nnQBqfeEWE6ZJ1XKyj5v/pl6+ENNScGl9
         kPESHxXrTE+XhGDqfLvtvvhwGajyEZm+Bv8FPmhtV+PI4K4FGdAHa0TJPR27okhSGp6i
         xhs/3Pp92pMo7lelMI2+9XrACItenHhDHOj8WJx4FxDtUUOk8iad8JflP/xyWpep5avj
         mCrFvZ2ZIU+3OTuFJ3u3j6CIiJyzibNFWn2tHMZRX51mxnZ2lvPhWArclivZqOd9jyIK
         LeP91otEcNBPtPSr0oyW1lhqGeiRnalaSvSc1Ds1E1eYj0teuJwmf9A9J99Wk3ijUqgo
         pGQw==
X-Forwarded-Encrypted: i=1; AJvYcCVe2X7gIVfHSMB3qTl/Jf5RUIFm2c7wn/SVP0gyiOhtBAVUfgWoTA24W3BiJ5caIkJTPvEffj3/TPJD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxhFlP7LszwwDL8BeAYhhfLdKH70Y+6p1H9sJGcmyu1tVKvXWPw
	+Y/edJjKfCdyfO5Z48wcclctzjZhQrK6otX1JHq9udBQB3JgaHgMrUAxiSfP
X-Google-Smtp-Source: AGHT+IEMW33trkUCtfKqFwSCLf9jiAM2FcSWi9V97QMN+aODiY/4DVhtg9gHrwxfdlYtSQisRubWyQ==
X-Received: by 2002:a05:690c:6f83:b0:6dd:d5b7:f35d with SMTP id 00721157ae682-6e2c728a287mr128474827b3.30.1728379171211;
        Tue, 08 Oct 2024 02:19:31 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d9401f6asm13464137b3.146.2024.10.08.02.19.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 02:19:29 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6dbc9a60480so45501997b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Oct 2024 02:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzHd5hBfWyr3XGbTlNTBlOYlOsfDDReBgYL68ZvAQ/ob7G81sXLZiidt4zWUU3uU2zTGaxUTjw3QiH@lists.linux-m68k.org
X-Received: by 2002:a05:690c:6084:b0:6dd:fb48:118c with SMTP id
 00721157ae682-6e2c7289faemr131719637b3.31.1728379168050; Tue, 08 Oct 2024
 02:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <41e9f3f320a70b4d0946f7e0c3622f1dd1e8791c.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <41e9f3f320a70b4d0946f7e0c3622f1dd1e8791c.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Oct 2024 11:19:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7kyLQHc8e6sL7jfQSJJWjkH29M8T7SWCgnKuJyh1xtQ@mail.gmail.com>
Message-ID: <CAMuHMdW7kyLQHc8e6sL7jfQSJJWjkH29M8T7SWCgnKuJyh1xtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
To: Finn Thain <fthain@linux-m68k.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 11:01=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> I tested this for regressions using qemu-system-sparc64.
> Also, Daniel tested the RTC functionality on his MVME147 system.
>
> Changed since v2:
>  - Use an int for the year offset in struct m48t59_plat_data.

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
