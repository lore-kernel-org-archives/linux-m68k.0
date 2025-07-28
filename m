Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C0273FE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753735374; cv=none; b=P79PPZCJjxVMPy0TfjS5Q9CuQsgPBrnUKyzaCSo7TGk5nedFMAs7keoz2X+/B+fSuhJANmW2zB+zZdjo8hxmEqnm7T6rff9TInV03b63zYcGZy92lfvRKMJjPFMjnLX9MLNyXgnoodu5p0mnD62CQmekvEaEDlYySs83rYy4064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753735374; c=relaxed/simple;
	bh=3BbfrhRL023bCnoufghKyCfJnh6KCVngknRQkjbRcK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmD1CVo1F01UxbL7oiIhz+dazAw75RUFnSwSUJWHNIbMAraWJXQl0vN9YSMMg72EG0K/Wntwxvm0hwU1VR4yFN8QA9pmZFfkNmvINVviN+8+IMQJRlSzN/DEUc/cAO0rwwRh5I1ww+qPldOrXZFxWpExWXgzbdfdo7qLcoepSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ksaXY9nY; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ksaXY9nY"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id gUgEuffUwftchgUgEut7YT; Mon, 28 Jul 2025 22:42:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753735362;
	bh=00a6wxssv4AqtrMurR4jTA4auwI7e+gZE+j7rFmkrX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ksaXY9nY1sMAnQzsAnflPplvIu2p+VE/zfsQGw6+mm5E46JJ/o/6LGH0cAQrxsUsa
	 V7mJzdIokAXaqEx+aCUnogX1S+NsJRxDIGXb1BsOLTn6K5hNw1hXWyzp6hUKdi+IXX
	 ffiZ0/PecFtIoL3PfcNe6TE78Xvjd5o7Dst+QEwPQcovs8IMb1gtAk4s95uoLpoE1X
	 1REvBB12Sz3Aq/P2x16SGcX/CPpIOZHjS4ZYljx8he5kKL/q1eR8rLvsMSpn7M4dRC
	 hukA8gHW15GQsTzZdKiDp0wRPRsaDf6YQY8zgRAktGrK9bqjmBhNn160CMcTyG/EfV
	 cebo7nplC6z/A==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 28 Jul 2025 22:42:42 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a07b9468-67aa-4e22-86af-817bb3295d1b@wanadoo.fr>
Date: Mon, 28 Jul 2025 22:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] zorro: fix checkpatch error by avoiding assignment in
 if-statement.
To: Dishank Jogi <jogidishank503@gmail.com>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 darshanrathod475@gmail.com
References: <20250728093412.48065-1-jogidishank503@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250728093412.48065-1-jogidishank503@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/07/2025 à 11:34, Dishank Jogi a écrit :
> These changes improve code readability and bring the file
> in line with the Linux kernel coding style.
> 
> No functional changes.
> 
> Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>
> ---
>   drivers/zorro/gen-devlist.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/zorro/gen-devlist.c b/drivers/zorro/gen-devlist.c
> index e325c5ce995b..ff4515e02409 100644
> --- a/drivers/zorro/gen-devlist.c
> +++ b/drivers/zorro/gen-devlist.c
> @@ -44,7 +44,8 @@ main(void)
>   
>   	while (fgets(line, sizeof(line)-1, stdin)) {
>   		lino++;
> -		if ((c = strchr(line, '\n')))
> +		c = strchr(line, '\n')

Looks like a trailing ; is missing.

Was this patch compile-tested?

No change is trivial, even if they look so.
Please always compile test your changes.

CJ

> +		if (c)
>   			*c = 0;
>   		if (!line[0] || line[0] == '#')
>   			continue;
> @@ -68,7 +69,8 @@ main(void)
>   					fprintf(devf, "\tPRODUCT(%s,%s,\"", manuf, line+1);
>   					pq(devf, c);
>   					fputs("\")\n", devf);
> -				} else goto err;
> +				} else
> +					goto err;
>   				break;
>   			default:
>   				goto err;

