Received: from mail.enpas.org (lighthouse.enpas.org [46.38.232.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C434D91F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.232.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954625; cv=none; b=E62wZYgzjF6npp2j8ZGSWzZp2GZHKgwUfMC0w6EUicxAozd8lfM5frJPizS7h3ZwiqG/IZSdchuuO4EXf3X8jdbN6kd1LctRd8Oq5GczKmUqvqTAzEwEpK2uFaJi0QEbFcNnyippBSIVePdNi4EYKVpPcYE8BhSyZRBe1Q4Ow8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954625; c=relaxed/simple;
	bh=emc4zUX6NmJU4RwB16CYry5ahUhaV/+whFqF1fX3UvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVtjXUzzLwk3/+p8k99+yvuLqfHQiNRRjErgNtXhLstDg7ob9eLb42DEtTlL1nmLIaF3FrrVuVaHUG8NqaYcn5KuyD3HhVFboPIF2qQTY3pxpcrwydHzoofzufJADQfiNUqRfaz2vRXxMqu318HXfHAkAirHDD6Jk+2BqUEEMrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.232.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id DB0D71035A4;
	Thu, 28 May 2026 07:50:13 +0000 (UTC)
Message-ID: <0efedf54-9afb-483e-b830-4f69a3220108@enpas.org>
Date: Thu, 28 May 2026 16:50:11 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] zorro: Simplify storing pointers in device id
 struct
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
 "Christian A. Ehrhardt" <lk@c--e.de>, linux-ide@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
 <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
In-Reply-To: <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/26/26 11:17 PM, Uwe Kleine-König (The Capable Hub) wrote:
> Technically it is fine (on all current Linux architectures) to store a
> pointer in an unsigned long variable. However this needs explicit
> casting which is an easy source for type mismatches.
> 
> By replacing the plain unsigned long .driver_data in struct
> zorro_device_id by an anonymous union, most of the casting can be
> dropped. There is still some implicit casting involved (between a void *
> and a driver specific pointer type), but that's better than the approach
> to store a pointer in an unsigned long variable as this doesn't lose the
> information that the data being pointed to is const.
> 
> All users of struct zorro_device_id are initialized in a way that is
> compatible with the new definition, so no adaptions are needed there.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>


Thanks Uwe!

Reviewed-by: Max Staudt <max@enpas.org>

