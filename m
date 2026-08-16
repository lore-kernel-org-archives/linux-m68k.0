Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63A301709
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786905431; cv=none; b=OwK0Kb/s9f3zdvDKshWIIOuV2bodi+Mp4M8lK610yUbEzz+cH9D6tP2PLnHpJB3tXH2v+5d5JZombCyhsc22Yck6qQwt4SrwsxaODgNlOSkNHMfqLQuVZj6NdA78m6+Tj44aulf0fdXyqA4l4uxQt6RaEY+vXWuM1bIVo2iT2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786905431; c=relaxed/simple;
	bh=N7HLf6d8Nz/syMV5s4Yf1rLjD0Nzt2vlpMLy8MmIWxg=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QPv//XELlGdZFaCOYH30Pq+SsXhIUEfw2UXa+8dalRlYPTllY+7NhV9h/EEOK1AZ1HDRW+p+2+wfafggRKFXBfCuHzWk5q4WWwLtMUSiI7rgUACSn2gypZWAmfvQJ/agf2RqBU4xw29uCsgbCJKdoV+RgD/QbB6TUPbo6K1lLyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k25WEdQs; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k25WEdQs"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso2078101a12.2
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786905429; x=1787510229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z4mIpJZjhlFuJPRbLBdNZD1k6jhDvLqRCr4L0uQaP6Y=;
        b=k25WEdQskIByKwzICRyDi3yy9v30r/WGecjJuxCCyYjoKdvwAL6uX4+QPyhdpearbX
         YndMWwqQm7d7dgwdxTlDFz4Q48C+0lGcy7F/nJCVallq1dAzyqc5XjSlcf9729JGBpEa
         xn2ZpC4q5hMKfLxz0o5zFwIcuYxhiC16m3Ke377oXp5bfFmutVg5OEQom7mr1EiG7wQv
         mTViN668iWKteJIbDST/WS1Js0bebS8yQKE7MXBccv9EQDq0GBGwwYf3O1uWrbGpf5jB
         lBnNfkWu3i+RMGSdeQi3bPAPH8GO75l40x8z5ANbYIIcK4XSMKG86UaFZLkmCk9nb2gO
         a/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786905429; x=1787510229;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4mIpJZjhlFuJPRbLBdNZD1k6jhDvLqRCr4L0uQaP6Y=;
        b=p8E9Puaiw+1wAP8gwpcztDZSZ2CZbdbcQPe8/9U9ktAbQjMx8zj9LAtik6xOgUoLKR
         aex2vOlWz1/vgZ7oI5ZHZ8SCgkCkz54vTyRks1FHyR9TjzqXYr8gK4WPhieuwz9+piHA
         Fs0fH8zzmUKD0voWK9so2tUrANHs/WP5KgC52l9ZuGdTelAQ4sWwO1PuLzqGli1iAUy+
         3h0z9dENDDl42lTar6HhE7nzDdczkXNYVPzOClrdfcvuL+/BqbvcUTJI0ACE+jX0tT/f
         9zChI8IQPBsVeW9664iZH9Cfn5u7/qYmnDWQFJT0351bAqUPaCJaKkePS+iHN8eZccIG
         6d6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoI2UyTLBPJDCocd3SOdUA2qzBCKrZGJJ8oNqsej3g+MxVa5yhgi4kf9Hn/G6PgQbrmZYtcrOji2SCW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21t3Q6rcRzDTunS8smLqyhEcLpj8R6eZWqUxfUipf9He4pgx2
	hGWRpndBcKvNGa2o4jkSzSjgZZ+sbjqrWoeKGN6bTKp0KB/Fttf00sYR9muXWg==
X-Gm-Gg: AR+sD11wPsU9ohMe/5qMt23j+EmFsejkKx2DUEWH28DlQBTzRj5bXkWzEOHAIOw061q
	L3zTAQD6EwIEBDlNF7HIGz/0fxIdyD9RWk+M06aIy5e+WIzgnuOUaWmzmYpkoRM30utPbM6vSlp
	yhUogunt2kuO4+G51uDPSTDPxhu5tNdy1CYeMcYvf9rR1Dgz59cn5BgE6lvZJzG51vRDed01HRT
	IxIwWsdKWIuZwxRFwA0mRV3ZvKm+jerL2fUBi1cBsH8TQ6juGkqtluwgzmzIoESjz0t9VWDuaS7
	XxQGtBmyHQ9U/JVmSpUH/fLIXgPv0KqnSsgU3shq9paa8M7d9e4nFftIsfdu/WTCH0imaSRNyTk
	HSNarIYGRfJn6FyrXzSn22h9BNYv7uE0VPRC427m3ejJlYageI7yZTSJhmI9Sc5mYLAHjKfiEWZ
	uBG3Rho6+9rUi/F+nDG4TU7d53Hi+QHrloTwXLdw0lj46MLTx6SM0aW7hYC+KzqAO2/9UmWgVBB
	W7mZY0D1cAzNRxcUlkPBP5aCsjopLnuAek=
X-Received: by 2002:a05:6a20:7345:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cc71d1e819mr20982093637.18.1786905429167;
        Sun, 16 Aug 2026 11:37:09 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fd3sm27777096eec.4.2026.08.16.11.37.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2026 11:37:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] fbdev: Give atafb proper parent
To: Helge Deller <deller@gmx.de>, linux-m68k@vger.kernel.org,
 geert@linux-m68k.org
References: <20260816073752.16656-1-schmitzmic@gmail.com>
 <20260816073752.16656-3-schmitzmic@gmail.com>
 <3d215ce1-6298-491e-81ef-b19bed7f1d9a@gmx.de>
Cc: Miro Kropacek <miro.kropacek@gmail.com>, linux-fbdev@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <41ca1d69-9a5e-7f4e-62a8-6f697e87e8f1@gmail.com>
Date: Mon, 17 Aug 2026 06:37:02 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3d215ce1-6298-491e-81ef-b19bed7f1d9a@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Helge,

no changes to the fbdev patches - just didn't know how else to avoid 
issues with b4.

Cheers,

	Michael


Am 17.08.2026 um 02:38 schrieb Helge Deller:
> On 8/16/26 09:37, Michael Schmitz wrote:
>> From: Miro Kropacek <miro.kropacek@gmail.com>
>>
>> The atafb fb device registers no parent, causing a missing symlink
>> (/sys/class/graphics/fb0/device). Xorg fbdevhw driver looks for that
>> symlink when scanning for devices, so add a parent node for atafb.
>>
>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> Cc: <linux-fbdev@vger.kernel.org>
>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>
> Did anything on the fbdev patches (#2-#4) changed between v1 and v2?
>
> Helge
>
