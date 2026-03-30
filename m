Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665622A817
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863992; cv=none; b=lQA1b0/lYIIfYVnZgsf4OdMxIeLyl3s7lzfePM6CavrL+mqPpjZL27fCL+7jlXNN1qHmyG8D3klh4NBx9tgsEXYSZIUjcOUBDH1EqZyBVZa6VdTwNEtp+QFM6QNT7B1pXgyHc285xp1mt5w9DzZhExMa10gdPhdumb5HSAH5xuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863992; c=relaxed/simple;
	bh=N76M8B2cuquWBYlnvKTyGxeGhd7gottRZ+t4XIrCe9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFgrKXo/T4tojPMmIank+sgCilCdezeqxGgUi/QeJ2RMMXiMTTIDsjPV6tjSDPLJqBWWMORtGl6/U5bwpU4Sq+ZVf1Uo4g5LcDb58WiiycHKFNnTmoFVU73eBXDMDklXgS0kz0Xcyu+EInXZU3gFKRQOHnAsf/cjIO8vbvR7jr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56cc8a021e2so3059999e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 02:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863990; x=1775468790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHMHJHQe/ri5b2eYwY69393V1zVWTax/fvz9Pb2Qttc=;
        b=qGMxEPD0IUTwYBEmDoOELdmE81YhfaU7YSH+AVsogvRbXEHUvIV5EMiQTgrzvoAnQE
         wTVZPw9FIneMRWJxArQEnDiXtw9aITMvS1AAaxGtkvsvNT7l1LsifVBGSjoW2gOIrV5+
         dLrAarF0k+enS4QqT5NVwqNAqEbLwQuVlqemGwU02O8Y5J47dgtUAoxTMEIS3s6yUG07
         J6btleOLifdztNjTwUawL/d5ax5Rofcu8kPejApv2X7CGgitUQvD2hBqHQfFkmgsUmD8
         +x3zdfKNU7A/rLub+EAPNN/l2IUwRtcZfKu4KSM17qz3g+ytAY2XXkrvj6ajVcOXhMsr
         6RzA==
X-Forwarded-Encrypted: i=1; AJvYcCVJuWTKJWLDr/2TEmKZXu7WZq1Penfz5K/b8RCNjv/E0PLNY9YpV0SDNLPV1m7H7RiVsWKDdvuoZhyT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy71ToqPPZ84DNOnTFW7WqzMyf6QIDxR97gPLyyA0jIDsboH0hn
	JmJMXmrJ6ZY8mLM6dBw+hMwF/cc+qvND6fMh9GfpPTU90ZtKkb7jUn6ByLOVRG6J
X-Gm-Gg: ATEYQzwU98RPLpGmxKM3C3er1ediiveffQxrmjlNwpycH7Giaw2vtrTJBU9cl8wnI9I
	sXPomQCzx/hUL/nc3OWhg2PBFOXFEkyNYNCC+jiJGKoPBlB+eUE7RycCyr4cSyOf8N0z5TUtJZv
	8gegh9bThKFeHIfUWOzEO307vxTUHZWblUG8oI9ZzlRa1aNGjzsJ5l06LeDoYnXg4HSFwE4Vhwz
	1DdAMUPEOKiwyD009qWssnUYbn8qMpDHSs6ZVJNRtyAwt/aTCCJf88sf63Vs1FsV1r3LfByWFIu
	S/k7T0yvhhN2N3y2UPBlCVi3JAwXo4ld5KEL9mRi3ZABbDdJWnemyYkjD0NnBBTU9GVqLMPxXDq
	qNwAsHyDrkKNzdGsbsq1NKpwn1CxSYSRcESvQzUpAeB92rC2JK7k6Xz8Cwi+GDk0AYPbOG0yDON
	wYJAUY1/C+eci6m3BvJ/6ncjSel2r2HdSYjEw8tcOZPaQVUGNJeKA/n3zGDIJA5Mcb
X-Received: by 2002:ac5:c92a:0:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-56d3d7d6ed1mr3890149e0c.10.1774863989933;
        Mon, 30 Mar 2026 02:46:29 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d588bb725sm7721791e0c.7.2026.03.30.02.46.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:46:29 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso3801359e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 02:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURjWac8N0INIhmi+/MVF4N8Ga4JzmhfduV+qAjiu+7ZmbY0VQn63+zb8gDh/AWxk/OX7dzqGBcNwVr@lists.linux-m68k.org
X-Received: by 2002:a05:6122:2790:b0:56b:a7de:7129 with SMTP id
 71dfb90a1353d-56d3d72d2a5mr4404048e0c.7.1774863988597; Mon, 30 Mar 2026
 02:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318001632.2974-3-thorsten.blum@linux.dev>
In-Reply-To: <20260318001632.2974-3-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 11:46:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_YzMnZZJPAmi43U29D_ROnjNNskEaKZiWa3vaHy52wA@mail.gmail.com>
X-Gm-Features: AQROBzAX0THSoEnjZGcbV45enHg0-aIKInYjxaj2qWO6L9bEp-YukENpvtt1I3o
Message-ID: <CAMuHMdV_YzMnZZJPAmi43U29D_ROnjNNskEaKZiWa3vaHy52wA@mail.gmail.com>
Subject: Re: [PATCH RESEND] m68k: emu: Replace unbounded sprintf in nfhd_init_one
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>, 
	Kees Cook <kees@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2026 at 01:17, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Replace unbounded sprintf() with the safer snprintf().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
