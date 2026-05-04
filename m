Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368737C0F2
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887128; cv=none; b=OjDhK1OL6KHBkPK+PWVsKzqn9fqrVufTBHRwYUajo69sqPjxV8pegVbRq44q8AAwznJxs6gVOVzXN2aHs8JlXJ+6+HSBJsgy6Xc261DXS4eU8caguOyFtdLTLhkt5QkmN0y4LFJ4nMUFm8O53o8O+4NzU7cYE25pwYtXLeg+KUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887128; c=relaxed/simple;
	bh=criV3dTbemAN5jzPyGMj1XZEYvhQMXG1W/7q0tDMrqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odsfdv0UyaoSyG2AY0vTP1f3vcYX0dRejH2w9FwzAiLw1AyvgM2pr3IYDRzpnwok3su3VdzvETSmiA9IKQBXG515rnmItBMLWfacnPiEurecEWnDzYkT04SBktSta0+QUNsF2fme+X4cbMGnZiLkebr/X3C+OZPmTiRJHqhq26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so1917853241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 02:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887126; x=1778491926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzCLB2dhs7e7+ZNW+ytEm54E6/Ysb/v9tiAssV8y1BY=;
        b=agXL3nRd6ahU9vpbNjw8rpyt0JvS/J/Kz8oJoJCUJsEbJ/RGNXvDjxKQTI4dpdSn5U
         mzsQ678d+KzXNAExH2H/LaF9yQAzB+OD1k2oLT3YC6gMrcUUMYtMWC+c1CjinI4obRDj
         veAMNXWaeTKQd1+FwuR1QeqnonQ9FKKQwGbwG5m24Zpgo5WzO+iU/jw0Q5PGkWzaWcQR
         1KdWYVLCHIiFDNviS+Huw6TEOozF+xWcPlMbxvz9iWG3GuHd/Rzft2R+LNf4FeeNHCKp
         6WjdPguEwGxkiq+rH+9kYmZAsNUh2Qc0ngtCuGXz1TlGxrPxyONmsS/KFn1sqvNOK65G
         c0nA==
X-Forwarded-Encrypted: i=1; AFNElJ+XzvkKW8Nvpeq8RoUMLSuVGnlKmsKbW8lBL0CJnojcq4+qnLlAAOGNaKqYMkpwKZxrIUJrMyFquNvR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzn7rXBghzNuA0ta5MnLF+qla7f8/9Y1cqsFIXTJjiubkPsPLLW
	ZJ3WPeOnCpb39gWlJoPkW16N+CEfU6pv6acUN7ho0nDstqDAjVpxZfeqJh/Jd5mx
X-Gm-Gg: AeBDievmPZxOljXf9lgi2lFg4aHtjjJYHG8OAjBu8AGIp/ahml00lx8Mdx7skbE5qWK
	dSHKhag+nZWrANlHVWEJnJmhKx9nGrq1HmP91rf3ME/XUrp61mJ49PTqWWKlZx0BzJ47uCFziO5
	MY2Zf3wYYdOFSxp+i4TV0BRo55vi8t48WIdS9RmBYgA1aJLQHwws1Fmhcs8sxnulfWl/senMVVp
	5kmzAfyYBReEupHz1kt0Nhj3S3S2a7HZiGdRhu9R5Iqm539kV9D7/YdwiaWX9MEDkXEi5m7gEdN
	yZfkMiysc3jCc6bb0jlxYX1TcGjAByjos/pXNIt4YZTgWYAThUPagC421Iw3XjYPgG5eY3AACsP
	GdygilxJjZwJ+guogv2PMHO/30qUCbsZIZBiEuFzsJjRKmRTLfRCQkhkmBH3pHjhbUtnpMcaPCs
	N8NgqURbOHPXhlhw7KsLGSBEjth//ruQnKduwb4VZobAY+Xn17EwjhQsJbfjI5hjdhcsED+rA=
X-Received: by 2002:a05:6102:580c:b0:610:a908:84a2 with SMTP id ada2fe7eead31-62d868116e0mr3344735137.17.1777887125695;
        Mon, 04 May 2026 02:32:05 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm5121564137.5.2026.05.04.02.32.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:32:05 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so1917846241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 02:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/nCh+s/6o4mVoGZEn0teXXAwG/wcrQx/9LM/rbUy5FqPYJRBekOCU5OtdDLRoaS1baflu2wuohKWmU@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2d0d:b0:610:76c6:b74a with SMTP id
 ada2fe7eead31-62d868151a0mr4086899137.14.1777887125040; Mon, 04 May 2026
 02:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504081804.3260-3-thorsten.blum@linux.dev>
In-Reply-To: <20260504081804.3260-3-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0vBK6Z4AFc3N_m87of2+ALmm2-HSj3vEO4BnznrMe5A@mail.gmail.com>
X-Gm-Features: AVHnY4JRMA2pePjOhpllFLArkLXnmRO7_lJtDUueDqtpz7lgKPhu7Wuv0k8TmQs
Message-ID: <CAMuHMdX0vBK6Z4AFc3N_m87of2+ALmm2-HSj3vEO4BnznrMe5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: dio: replace deprecated strcpy with
 strscpy in dio_init
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 10:18, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. While the
> current code works correctly, replace strcpy() with the safer strscpy()
> to follow secure coding best practices.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
