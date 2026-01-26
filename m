Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B129222575
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426155; cv=none; b=GaI5POqhKdom3+qm3CrjDmoDaTY2PCDwPd3K42pCfJ3hzOjBILCAfs/+63nVHsnQwyRKA2uTE7dPHfX1G9ScdRokw0d9+0yPeMYT9JbnyiYhTgEuqGjGUss+5X0AHTUN+gOL/m+jfUAjDfouh7Lmi/86ZYGPGVs31q3IAr1PL3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426155; c=relaxed/simple;
	bh=JbTGtzc2mzKBMxPj4Ue9JCghzTgDHNnJt4uoy49bwv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpPt1lkQyRBQUi+stjWTOD0JQCsQeR4f1FI7fYMZVUefXuCu/8h82L2eeQQC+AvCm/iay6GvbQQqfwlOVh80dnmsM6qpk/mWdwRoki/yZsJzktcLxiEiR+4r/PseQRyd78l6qUM0khxf2t1sdKDi5nGFKZX55fmtAbgvtMVo9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5664634a27fso454200e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 03:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426153; x=1770030953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJIfH5Aon7srwHhfRUF+/BJZV8CEdhhUZHGETNPgMrY=;
        b=CRkCqRdzea0cN+wC5LuhTSwdNWuOgXJQhNKOFhWVijzrm512UrUGcbDkAWWpzRbkht
         4tqDl+lTGKC6fKMt6AcaTFJRPtrvAwGNfCFahhcws8JH4wOmgIy/qGmkzlPkBS64Ow0s
         4CmhLWtnt/cWkm3MRu7jnoaidrxZejwEfHTgyCVmwUpOI28G6Pl8MrNlxQld6QrveKch
         fXWwl2jAnjrAYfZWGcVp70J5/8JtTPv3kndyCacr9t5MnqySO40f465idKD93q+JmK8J
         d0Z9P7RYLL6uxouZuRR531OiDPRrW8syJNw6BUFufvToN70CQdcZmRWKe5dF/OsoXie8
         dNRw==
X-Forwarded-Encrypted: i=1; AJvYcCUJxADxp79wpOu082GPU0cO+oPyysXo65zDfZAqUdCxfyYGUIk6wNMeJ07nx2NS5SMLq8k3B5Sd5XYp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwGcbJmwjJw9m9RL8FAPkBCIvdJv8QfKdf2J7deXuUkaeUGWRMB
	Jq91nDdm61s1JsJALBFVGd1mTBJ8j3SR5hl2q2JOUno2pEpOWLAjztjOj67VIFeH
X-Gm-Gg: AZuq6aKrd+mXppU6yMPuO5XzbOyhJO4jXI/LF2HmgwNwkn5Ju5JkL1nuy4mktYQUOH5
	2ery1GHAsyNJRR5vLji/U3knDsq2inTHbLHoNszswfJNZse8KiRw4faAVjvJpXtXJBXAnHMMnff
	8tBIRxlq321ByTLQ90OM2chD1Z5j1NcOkqA00+Ggc5rXti37+1gz9ViepBG5PpN4dVrkvgGK75G
	ze51IeFQ6qsd/wgSQeXUaOUsjYhk1+mA6z8MEAY0sA4V3FRx+14lKHzCNzhuIusM3GrRpwSkoXA
	YrgR95mN6gOUA/2Sq3hlOxdfD3oQZ3/gWU1fquFJ3iuoSXTZghBdYe7Mo417UXPmKcQmKcYe7J3
	kVdm/OHD10xC+xIOL40FqlgpZU6pNtY+lqoFsH8Ml6MIEZL+7rSHbWXE/BNy4VQf7SpB+Htqy6F
	0JW9eh2CfXaPJuVuE3wUIhtSOZlHZTIPSwJrNk2X+IW/2DQJJR
X-Received: by 2002:a05:6122:240c:b0:563:5f68:7a75 with SMTP id 71dfb90a1353d-5665ca08509mr960715e0c.20.1769426152837;
        Mon, 26 Jan 2026 03:15:52 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa96675sm1648827e0c.9.2026.01.26.03.15.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:15:52 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-941275fece4so940288241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 03:15:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTuvULV9YjF24sasV9TSYdsHMpi9h0zos4VuVjLmKQihT5YUa/i9kYpRK323/LfOCMByUlXXabOPpn@lists.linux-m68k.org
X-Received: by 2002:a05:6102:b0a:b0:5f5:4d9b:bd67 with SMTP id
 ada2fe7eead31-5f5762cd92emr956147137.6.1769426151820; Mon, 26 Jan 2026
 03:15:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117202152.1036278-2-thorsten.blum@linux.dev>
In-Reply-To: <20260117202152.1036278-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 12:15:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7-Pnp94XimfMpZEhX+7Lqwcw=txmSbmP093qwKgeKtA@mail.gmail.com>
X-Gm-Features: AZwV_QjqyriwL9plB4iJXqQJS36NK4Yq_f4sx6c7Es0KXYdjcq2O4A_TN9DYGF8
Message-ID: <CAMuHMdW7-Pnp94XimfMpZEhX+7Lqwcw=txmSbmP093qwKgeKtA@mail.gmail.com>
Subject: Re: [PATCH] m68k: sun3: Replace vsprintf() with bounded vsnprintf()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jan 2026 at 21:22, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> vsprintf() performs no bounds checking and can overflow - replace it
> with the safer vsnprintf().
>
> Also remove the useless '+ 1' that is a leftover of commit 66ed28ea096c
> ("m68k: sun3: Remove unused vsprintf() return value in prom_printf()").
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
