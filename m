Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E51E04BD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Apr 2025 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745268867; cv=none; b=cy1K3s2tXGMBYcS4lHaK8U4VzhPTuFornx7EnuI5y5gYbu0djH4V1cwUX9gKEvTejB2BLJ7NG+I90OHzbiEEQQqrITapTA0WSOTVASyM/M+/EBj8mi/7qcnOTQ7NNtjcqNTZkwm6BO/gRVV7a+IjIU7s+VoDN05+Lc6vUgeRsIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745268867; c=relaxed/simple;
	bh=XxM0yFQM/XsWnksiWB9etTGV+M2Iz0tcXkVYk7Sdeh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQlu6WzRK44in1hqi82g8iqQlo9gTRJ/yixPZVog9kDsOWg8TJxq0zqKm7NQWPR7X2WkcGaWSO2nFQ7jmsU3dFR1pq2DUHSG/FMGOltvrst4I/eQLzfMwZNzWAMlTJwbU15D3+u7w37HYxN6kDusrNSTo2WvtfcUi0Pey1w8U7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=DK24PrNd; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="DK24PrNd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ED5F443B2;
	Mon, 21 Apr 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1745268862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glfTNh/iJip184nrrz3+eR269IZNpsD9csDS/SVYGfA=;
	b=DK24PrNdgtcUrqUz5K/eJA0UMvIT5c6B29I6igCc/qNjNtdDLvwS6pXeyAIIyCs5Efy6pv
	+NuLgZHwE3xa8NNDEKvWnDNKJjOWJ1i1HEe6PVTN7sZA5/3o4nRsJy0Jun3jSI+CtwP7+V
	cMa0YsFAiyVqv8TDc5D7b2H+JUkdp3Yk3ImkmLLWD1aCkih5sqTyrpzRPfdrXU+OCIR1YO
	0MQcZWWQZ5b5UPnHt9JjI9isJb3d8fJ44v6ac/V+xZIhFl2v3Vx4KIm4GOCfxto1KbXrUl
	X9ljT7nvUlFKl0had+jKjnK5fB8bhE+/7yM+PgHTNfviihJ7dPd9C/oC0jaMyQ==
Message-ID: <5e3208cb-9d4f-4553-ab5d-4709eafdd7e4@yoseli.org>
Date: Mon, 21 Apr 2025 22:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: mm: Replace strcpy() with strscpy() in
 hardware_proc_show()
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <20250421122839.363619-1-thorsten.blum@linux.dev>
 <f178cc44-1b97-4e72-94ae-cffa08173a99@yoseli.org>
 <1637cf38-da51-eb86-432f-aa6ad9628f2c@gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <1637cf38-da51-eb86-432f-aa6ad9628f2c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedukeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeefieetgeehvdeggffgffetheehhfetkeefhefhgeeuheetueffueeikefgffffteenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepgedprhgtphhtthhopehstghhmhhithiimhhitgesghhmrghilhdrtghomhdprhgtphhtthhopehthhhorhhsthgvnhdrsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Michael,

On 21/04/2025 22:35, Michael Schmitz wrote:
> Jean-Michel,
> 
> Am 22.04.2025 um 01:02 schrieb Jean-Michel Hautbois:
> 
>> As we are not using the return value, I think it is a safe replacement.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Would not 'Reviewed-by' be more appropriate here?
> 
Oh my, indeed, not enough sleeping lately :-/ !

JM
