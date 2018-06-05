From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] Fix atari label false positives
Date: Tue, 5 Jun 2018 16:43:12 +0200
Message-ID: <8cc04095-8913-dc80-211d-a6362a6cb985@physik.fu-berlin.de>
References: <20180605143045.23875-1-psusi@ubuntu.com>
 <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>
 <208fded9-0bfc-0578-7a57-98b5c3af78dc@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <208fded9-0bfc-0578-7a57-98b5c3af78dc-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
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

On 06/05/2018 04:40 PM, Phillip Susi wrote:
> On 6/5/2018 10:35 AM, John Paul Adrian Glaubitz wrote:
>> Is that the reversed patch? I thought you wanted to move the atari
>> probing to the bottom?
> 
> No; the order they are probed in is the reverse of the order they are
> initialized in because the fs registration puts the new one on the head
> and slides the previously registered ones further down.

I see, thanks for the explanation.

I hope that I can fix the partition atari detection code sometime in the
future. I need to have a look at the partition probing code in the Linux
kernel where it works without false positives.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
