From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] Fix atari label false positives
Date: Tue, 5 Jun 2018 16:35:39 +0200
Message-ID: <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>
References: <20180605143045.23875-1-psusi@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <20180605143045.23875-1-psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/options/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=unsubscribe>
List-Archive: <http://alioth-lists.debian.net/pipermail/parted-devel/>
List-Post: <mailto:parted-devel-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Help: <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=help>
List-Subscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=subscribe>
Errors-To: parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org
Sender: "parted-devel"
 <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
To: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org
List-Id: linux-m68k@vger.kernel.org



On 06/05/2018 04:30 PM, Phillip Susi wrote:
> diff --git a/libparted/libparted.c b/libparted/libparted.c
> index d855d0e6..e864d1b3 100644
> --- a/libparted/libparted.c
> +++ b/libparted/libparted.c
> @@ -85,7 +85,7 @@ init_disk_types ()
>  #if defined __s390__ || defined __s390x__
>  	ped_disk_dasd_init();
>  #endif
> -
> +	ped_disk_atari_init ();
>  	ped_disk_sun_init ();
>  #ifdef ENABLE_PC98
>  	ped_disk_pc98_init ();
> @@ -97,7 +97,6 @@ init_disk_types ()
>  	ped_disk_bsd_init ();
>  	ped_disk_amiga_init ();
>  	ped_disk_aix_init ();
> -	ped_disk_atari_init ();
>  }

Is that the reversed patch? I thought you wanted to move the atari
probing to the bottom?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
